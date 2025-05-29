// CoopsOS Control Room - Web Dashboard import { useState } from 'react'; import { Card, CardContent } from '@/components/ui/card'; import { Button } from '@/components/ui/button'; import { Input } from '@/components/ui/input'; import { Tabs, TabsList, TabsTrigger, TabsContent } from '@/components/ui/tabs'; import { TerminalSquare, Github, KeyRound, RefreshCw } from 'lucide-react'; import { motion } from 'framer-motion';

export default function ControlRoom() { const [devKey, setDevKey] = useState(''); const [output, setOutput] = useState('Welcome to CoopsOS Control Room');

const runCommand = async (command) => { setOutput(Running: ${command}...); // Simulated result (you can plug into real backend APIs or Termux remote shell) setTimeout(() => { setOutput(✓ ${command} completed successfully.); }, 1200); };

return ( <div className="p-4 max-w-4xl mx-auto"> <motion.h1 className="text-4xl font-bold text-center mb-6" initial={{ opacity: 0 }} animate={{ opacity: 1 }}>CoopsOS DevOps Control Room</motion.h1>

<Tabs defaultValue="terminal">
    <TabsList className="grid grid-cols-4">
      <TabsTrigger value="terminal"><TerminalSquare className="inline-block mr-2" />Terminal</TabsTrigger>
      <TabsTrigger value="github"><Github className="inline-block mr-2" />GitHub</TabsTrigger>
      <TabsTrigger value="security"><KeyRound className="inline-block mr-2" />Security</TabsTrigger>
      <TabsTrigger value="sync"><RefreshCw className="inline-block mr-2" />Sync</TabsTrigger>
    </TabsList>

    <TabsContent value="terminal">
      <Card className="mt-4">
        <CardContent className="space-y-4">
          <Input placeholder="Enter command..." onKeyDown={(e) => {
            if (e.key === 'Enter') runCommand(e.target.value);
          }} />
          <pre className="bg-black text-green-400 p-3 rounded-lg">{output}</pre>
        </CardContent>
      </Card>
    </TabsContent>

    <TabsContent value="github">
      <Card className="mt-4">
        <CardContent className="space-y-4">
          <Button onClick={() => runCommand('git pull origin main')}>Pull Latest</Button>
          <Button onClick={() => runCommand('git push origin main')} variant="secondary">Push Changes</Button>
          <Button onClick={() => runCommand('bash make-version.sh')} variant="outline">Make Version</Button>
        </CardContent>
      </Card>
    </TabsContent>

    <TabsContent value="security">
      <Card className="mt-4">
        <CardContent className="space-y-4">
          <Input placeholder="Enter Dev Key..." value={devKey} onChange={e => setDevKey(e.target.value)} />
          <Button onClick={() => runCommand(`validate-key ${devKey}`)}>Validate Dev Key</Button>
          <Button variant="destructive" onClick={() => runCommand('LOCKDOWN')}>Activate Lockdown Mode</Button>
        </CardContent>
      </Card>
    </TabsContent>

    <TabsContent value="sync">
      <Card className="mt-4">
        <CardContent className="space-y-4">
          <Button onClick={() => runCommand('bash ota-updater.sh')}>OTA Sync</Button>
          <Button onClick={() => runCommand('bash push-release.sh')} variant="secondary">Push Release</Button>
          <Button onClick={() => runCommand('bash track-changelog.sh')} variant="outline">Track Changelog</Button>
        </CardContent>
      </Card>
    </TabsContent>
  </Tabs>
</div>

); }


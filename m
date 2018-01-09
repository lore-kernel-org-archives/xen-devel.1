From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [BUG] unable to shutdown (page fault in
 mwait_idle()/do_dbs_timer()/__find_next_bit()) (fwd)
Date: Tue, 09 Jan 2018 09:25:11 -0700
Message-ID: <5A54FAF7020000780019CD3E@prv-mh.provo.novell.com>
References: <alpine.GSO.2.00.1801071253201.12024@dmz.c-home.cz>
 <5A534F63020000780019C036@prv-mh.provo.novell.com>
 <alpine.GSO.2.00.1801081614550.20626@dmz.c-home.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=__Part7D467EF7.1__="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=o7xp=ee=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYwiG-0002mi-L2
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 16:25:20 +0000
In-Reply-To: <alpine.GSO.2.00.1801081614550.20626@dmz.c-home.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Martin Cerveny <M.Cerveny@computer.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=__Part7D467EF7.1__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

>>> On 08.01.18 at 17:07, <martin@c-home.cz> wrote:
> On Mon, 8 Jan 2018, Jan Beulich wrote:
>>>>> On 07.01.18 at 13:34, <martin@c-home.cz> wrote:
>>> (XEN) ----[ Xen-4.10.0-vgpu  x86_64  debug=3Dn   Not tainted ]----
>>
>> The -vgpu tag makes me wonder whether you have any patches in
>> your tree on top of plain 4.10.0 (or 4.10-staging). Also the debug=3Dn
>> above ...
>=20
> 4.10.0 + 11 patches to make nvidia/vgpu work=20
> (https://github.com/xenserver/xen-4.7.pg).
> debug=3Dn because xen's modified debug build process.
>=20
>>> (XEN)    [<ffff82d08026ae60>] __find_next_bit+0x10/0x80
>>> (XEN)    [<ffff82d080253180>] cpufreq_ondemand.c#do_dbs_timer+0x160/0x2=
20
>>> (XEN)    [<ffff82d0802c7c0e>] mwait-idle.c#mwait_idle+0x23e/0x340
>>> (XEN)    [<ffff82d08026fa56>] domain.c#idle_loop+0x86/0xc0
>>
>> ... makes this call trace unreliable. But even with a reliable call
>> trace, analysis of the crash would be helped if you made
>> available the xen-syms (or xen.efi, depending on how you boot)
>> somewhere.
>=20
> xen-syms - http://www.uschovna.cz/en/zasilka/UDP5LVE2679CGBIS-4YV/=20

Thanks. Looks to be a race between a timer in the governor and
the CPUs being brought down. In general the governor is supposed
to be disabled in the course of CPUs being brought down, so first
of all I wonder whether you're having some daemon in use which
sends management requests to the CPUfreq driver in Xen. Such a
daemon should of course be disabled by the system shutdown
scripts. Otherwise please try the attached debugging patch -
maybe we can see something from its output.

Jan


--=__Part7D467EF7.1__=
Content-Type: text/plain; name="cpufreq-ondemand-crash.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="cpufreq-ondemand-crash.patch"

--- unstable.orig/xen/drivers/cpufreq/cpufreq.c	2017-09-12 12:39:58.3105563=
79 +0200=0A+++ unstable/xen/drivers/cpufreq/cpufreq.c	2018-01-09 =
17:21:09.659208437 +0100=0A@@ -352,6 +352,8 @@ int cpufreq_del_cpu(unsigned=
 int cpu)=0A =0A     /* for HW_ALL, stop gov for each core of the _PSD =
domain */=0A     /* for SW_ALL & SW_ANY, stop gov for the 1st core of the =
_PSD domain */=0A+printk("cpufreq: del CPU%u (%u,%lx,%lu,%lx)\n", =
cpu,//temp=0A+       hw_all, cpufreq_dom->map->bits[0], perf->domain_info.n=
um_processors, policy->cpus->bits[0]);//temp=0A     if (hw_all || =
(cpumask_weight(cpufreq_dom->map) =3D=3D=0A                    perf->domain=
_info.num_processors))=0A         __cpufreq_governor(policy, CPUFREQ_GOV_ST=
OP);=0A--- unstable.orig/xen/drivers/cpufreq/cpufreq_ondemand.c	2017-09-12 =
12:39:58.310556379 +0200=0A+++ unstable/xen/drivers/cpufreq/cpufreq_ondeman=
d.c	2018-01-09 17:16:07.633604995 +0100=0A@@ -218,6 +218,9 @@ int =
cpufreq_governor_dbs(struct cpufreq_=0A =0A     switch (event) {=0A     =
case CPUFREQ_GOV_START:=0A+if(system_state > SYS_STATE_active) {//temp=0A+ =
printk("dbs: start CPU%u [%pS]\n", cpu, __builtin_return_address(0));=0A+}=
=0A         if ((!cpu_online(cpu)) || (!policy->cur))=0A             =
return -EINVAL;=0A =0A
--=__Part7D467EF7.1__=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=__Part7D467EF7.1__=--

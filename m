From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 15:10:00 +0000
Message-ID: <9ad3d985-58a3-085b-f898-d1079dee4e37@invisiblethingslab.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <5B06CBFA02000078001C59EC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1537568267936611223=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wtyo=il=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1fLrtN-0001tj-12
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 15:11:01 +0000
In-Reply-To: <5B06CBFA02000078001C59EC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1537568267936611223==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="mX5oPwTWZSQV1YbPC11jwvKtX99jCzDz8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mX5oPwTWZSQV1YbPC11jwvKtX99jCzDz8
Content-Type: multipart/mixed; boundary="kO4W0GMPIuOLGqwvZ6MrR4TorScGXfSI4";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Message-ID: <9ad3d985-58a3-085b-f898-d1079dee4e37@invisiblethingslab.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining in general)
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <5B06CBFA02000078001C59EC@prv1-mh.provo.novell.com>
In-Reply-To: <5B06CBFA02000078001C59EC@prv1-mh.provo.novell.com>

--kO4W0GMPIuOLGqwvZ6MrR4TorScGXfSI4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
>>>> On 24.05.18 at 16:14, <simon@invisiblethingslab.com> wrote:
>> Jan Beulich:
>>>>>> On 24.05.18 at 16:00, <simon@invisiblethingslab.com> wrote:
>>>> Jan Beulich:
>>>>> In commit d1d6fc97d6 ("x86/xpti: really hide almost all of Xen imag=
e")
>>>>> I've failed to remember the fact that multiple CPUs share a stub
>>>>> mapping page. Therefore it is wrong to unconditionally zap the mapp=
ing
>>>>> when bringing down a CPU; it may only be unmapped when no other onl=
ine
>>>>> CPU uses that same page.
>>>>>
>>>>> Reported-by: Simon Gaiser <simon@invisiblethingslab.com>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> --- a/xen/arch/x86/smpboot.c
>>>>> +++ b/xen/arch/x86/smpboot.c
>>>>> @@ -876,7 +876,21 @@ static void cleanup_cpu_root_pgt(unsigne
>>>>> =20
>>>>>      free_xen_pagetable(rpt);
>>>>> =20
>>>>> -    /* Also zap the stub mapping for this CPU. */
>>>>> +    /*
>>>>> +     * Also zap the stub mapping for this CPU, if no other online =
one uses
>>>>> +     * the same page.
>>>>> +     */
>>>>> +    if ( stub_linear )
>>>>> +    {
>>>>> +        unsigned int other;
>>>>> +
>>>>> +        for_each_online_cpu(other)
>>>>> +            if ( !((per_cpu(stubs.addr, other) ^ stub_linear) >> P=
AGE_SHIFT) )
>>>>> +            {
>>>>> +                stub_linear =3D 0;
>>>>> +                break;
>>>>> +            }
>>>>> +    }
>>>>>      if ( stub_linear )
>>>>>      {
>>>>>          l3_pgentry_t *l3t =3D l4e_to_l3e(common_pgt);
>>>>
>>>> Tried this on-top of staging (fc5805daef) and I still get the same
>>>> double fault.
>>>
>>> Hmm, it worked for me offlining (and later re-onlining) several pCPU-=
s. What
>>> size a system are you testing on? Mine has got only 12 CPUs, i.e. all=
 stubs
>>> are in the same page (and I'd never unmap anything here at all).
>>
>> 4 cores + HT, so 8 CPUs from Xen's PoV.
>=20
> May I ask you to do two things:
> 1) confirm that you can offline CPUs successfully using xen-hptool,
> 2) add a printk() to the code above making clear whether/when any
> of the mappings actually get zapped?

There seem to be two failure modes now. It seems that both can be
triggered either by offlining a cpu or by suspend. Using cpu offlining
below since during suspend I often loose part of the serial output.

Failure mode 1, the double fault as before:

root@localhost:~# xen-hptool cpu-offline 3
Prepare to offline CPU 3
(XEN) Broke affinity for irq 9
(XEN) Broke affinity for irq 29
(XEN) dbg: stub_linear't1 =3D 18446606431818858880
(XEN) dbg: first stub_linear if
(XEN) dbg: stub_linear't2 =3D 18446606431818858880
(XEN) dbg: second stub_linear if
CPU 3 offlined successfully
root@localhost:~# (XEN) *** DOUBLE FAULT ***
(XEN) ----[ Xen-4.11-rc  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08037b964>] handle_exception+0x9c/0xff
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
(XEN) rax: ffffc90040cdc0a8   rbx: 0000000000000000   rcx: 00000000000000=
06
(XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 00000000000000=
00
(XEN) rbp: 000036ffbf323f37   rsp: ffffc90040cdc000   r8:  00000000000000=
00
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000000=
00
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: ffffc90040cdff=
ff
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000000426=
60
(XEN) cr3: 0000000128109000   cr2: ffffc90040cdbff8
(XEN) fsb: 00007fc01c3c6dc0   gsb: ffff88021e700000   gss: 00000000000000=
00
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d08037b964> (handle_exception+0x9c/0xff):
(XEN)  00 f3 90 0f ae e8 eb f9 <e8> 07 00 00 00 f3 90 0f ae e8 eb f9 83 e=
9 01 75
(XEN) Current stack base ffffc90040cd8000 differs from expected ffff8300c=
ec88000
(XEN) Valid stack range: ffffc90040cde000-ffffc90040ce0000, sp=3Dffffc900=
40cdc000, tss.rsp0=3Dffff8300cec8ffa0
(XEN) No stack overflow detected. Skipping stack trace.
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) DOUBLE FAULT -- system shutdown
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...

Failure mode 2, dom0 kernel panic (Debian unstable default kernel):

root@localhost:~# xen-hptool cpu-offline 3
Prepare to offline CPU 3
(XEN) Broke affinity for irq 9
(XEN) Broke affinity for irq 26
(XEN) Broke affinity for irq 28
(XEN) dbg: stub_linear't1 =3D 18446606431818858880
(XEN) dbg: first stub_linear if
(XEN) dbg: stub_linear't2 =3D 18446606431818858880
(XEN) dbg: second stub_linear if
CPU 3 offlined successfully
root@localhost:~# [   42.976030] BUG: unable to handle kernel NULL pointe=
r dereference at 0000000000000000
[   42.976178] IP: __evtchn_fifo_handle_events+0x43/0x1a0
[   42.976256] PGD 0 P4D 0=20
[   42.976305] Oops: 0002 [#1] SMP NOPTI
[   42.976367] Modules linked in: ctr ccm bnep ip6t_REJECT nf_reject_ipv6=
 ip6table_filter ip6_tables ipt_REJECT nf_reject_ipv4 xt_tcpudp iptable_f=
ilter arc4 snd_hda_codec_hdmi dell_rbtn iwldvm nouveau intel_rapl intel_p=
owerclamp dell_laptop dell_wmi btusb btrtl dell_smbios iTCO_wdt btbcm mxm=
_wmi btintel crct10dif_pclmul sparse_keymap wmi_bmof dell_wmi_descriptor =
iTCO_vendor_support ppdev mac80211 snd_hda_codec_idt dcdbas crc32_pclmul =
snd_hda_codec_generic ttm dell_smm_hwmon ghash_clmulni_intel bluetooth dr=
m_kms_helper iwlwifi snd_hda_intel joydev evdev intel_rapl_perf snd_hda_c=
odec serio_raw drm drbg pcspkr snd_hda_core i2c_algo_bit cfg80211 ansi_cp=
rng snd_hwdep snd_pcm snd_timer mei_me snd ecdh_generic rfkill sg soundco=
re mei lpc_ich shpchp wmi tpm_tis parport_pc tpm_tis_core tpm parport rng=
_core video
[   42.977349]  dell_smo8800 ac battery button xen_acpi_processor xen_pci=
back xenfs xen_privcmd xen_netback xen_blkback xen_gntalloc xen_gntdev xe=
n_evtchn ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generi=
c fscrypto ecb sr_mod cdrom sd_mod crc32c_intel ahci libahci aesni_intel =
sdhci_pci aes_x86_64 crypto_simd cqhci ehci_pci libata cryptd firewire_oh=
ci sdhci ehci_hcd glue_helper firewire_core psmouse i2c_i801 scsi_mod mmc=
_core crc_itu_t usbcore e1000e usb_common thermal
[   42.977953] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.16.0-1-amd64 #=
1 Debian 4.16.5-1
[   42.978061] Hardware name: Dell Inc. Latitude E6520/0692FT, BIOS A20 0=
5/12/2017
[   42.978167] RIP: e030:__evtchn_fifo_handle_events+0x43/0x1a0
[   42.978250] RSP: e02b:ffff88021e643f60 EFLAGS: 00010046
[   42.978327] RAX: 0000000000000000 RBX: ffff88021e6540e0 RCX: 000000000=
0000000
[   42.978427] RDX: ffff88021e640000 RSI: 0000000000000000 RDI: 000000000=
0000001
[   42.978527] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000=
0000000
[   42.978626] R10: ffffc90040cc7e28 R11: 0000000000000000 R12: 000000000=
0000001
[   42.978725] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
[   42.978857] FS:  00007fb6cddee8c0(0000) GS:ffff88021e640000(0000) knlG=
S:0000000000000000
[   42.978969] CS:  e033 DS: 002b ES: 002b CR0: 0000000080050033
[   42.979052] CR2: 0000000000000000 CR3: 00000002126e2000 CR4: 000000000=
0042660
[   42.979165] Call Trace:
[   42.979210]  <IRQ>
[   42.979256]  ? __tick_nohz_idle_enter+0xee/0x440
[   42.979331]  __xen_evtchn_do_upcall+0x42/0x80
[   42.979402]  xen_evtchn_do_upcall+0x27/0x40
[   42.979471]  xen_do_hypervisor_callback+0x29/0x40

As you can see in both cases it branches into the ifs. The logged
stub_linear values are directly before the ifs.


--kO4W0GMPIuOLGqwvZ6MrR4TorScGXfSI4--

--mX5oPwTWZSQV1YbPC11jwvKtX99jCzDz8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlsG1fcACgkQkO9xfO/x
ly8UyQ//Y3TCatQliEdykSj8tOVS7F+/5fdvagZwQsTG8GyyMyCIWYvgvT+6QZka
1F0W1+RCs16yjCoPRXo/ZmrIWggW41iUiwnljJU1R+cTv9Ynj8ebBm3NvBkoHjIa
MJPMRRwO7xKXSzStNtu455C5S1nlrqJCJxFpDuwIut45rgWEtNPxuAet+F2pa0Fe
ha1tY1iulVFVUbhWJvwj5HxxSVH0y6kSNwRFALVVevNIbc/q00qqkUXIMXvICnvO
MeuzfB4ekNECWbk0shaLA0ZM+r+KVrXdpKwpwcrCYZfGS38OlLl62aBRVreN2kB4
svf89fXTY1PAKpuAX/CBkAhm2X5cUnXjDzvZMpt9KKyLSjwn5bMctbQMYqzx1IYi
e6dYfbp2w8t/OKVJx32ny5nt0oen5EsJd4hP3fafrj1BdhpcXLvOtbrVBepJ8IPd
WNhiZpX9fzrbfPojp4N7Dz3lZSr2sUFWiYw96aEw3sFlxugzCQnFouFv2nCT44iF
rpM6uR1hpfzqXKu+hkscdtukqgnkZCHZduQbxn+8g6JOJdgm21PuTUvHFaLgpZpZ
AmTMaUpA+UlakdUFSvM4f96MYTo5oqn867A4D57C3f3r+Zw8DihlwivzKFv+1zPs
0T3sM39pULuFR+UCdopvokHyhtxZZYdrTqDJArs94Gy58CI/3SE=
=4wIr
-----END PGP SIGNATURE-----

--mX5oPwTWZSQV1YbPC11jwvKtX99jCzDz8--


--===============1537568267936611223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1537568267936611223==--

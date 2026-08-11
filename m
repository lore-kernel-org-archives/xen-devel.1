Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD7DC5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 21:01:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388591.1629595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wttaY-0004qe-MR; Tue, 11 Aug 2026 21:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388591.1629595; Tue, 11 Aug 2026 21:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wttaY-0004qX-JW; Tue, 11 Aug 2026 21:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1388591;
 Tue, 11 Aug 2026 21:00:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+b6a5eba76e218a018a6a+8388+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wttaU-0004qN-7x
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 21:00:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wttaT-00ALeB-9V; Tue, 11 Aug 2026 23:00:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+b6a5eba76e218a018a6a+8388+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a7b8d70-2eae-0a2a0a5409dd-0a2a45069ac6-24
 for <multiple-recipients>; Tue, 11 Aug 2026 23:00:41 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+b6a5eba76e218a018a6a+8388+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a7b8d78-195a-0a2a45060019-5a9b3222ceda-3
 for <multiple-recipients>; Tue, 11 Aug 2026 23:00:41 +0200
Received: from [2001:8b0:10b:5:e09:5b1f:c111:693d]
 (helo=u09cd745991455d.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wttaE-0000000105J-48iN; Tue, 11 Aug 2026 21:00:27 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mmyYWtKzdsnw9WFOx22ZcstG8Ar0fvF3/BQLp7xYMvA=; b=p6vw5iz5fkmByvF63Cvl1HY2Co
	NXp9Fax9G2YD5a7ZUr3g9Rz7NVYPvW6BO8Zws3JC1uIDPrhr8OSacffPmwoLLLcrSvlBDAm3+y/Ag
	isQ4YXTrKYbvBu3LQjhFcCoFyd0vxf2XiSYIacbuYnKPYsupX4CAGjhcLhQcSGhujqwMpDa0CmbQn
	xfsd0rtxeYi0nFYtfQUHfpWMBn21Pa/voaKl0TZ4nT/Xg68Xw+fCbuZHNciNNF7w9jFBVhZs4C84Z
	U8QJvdN9e8Gxahy452SdtOEX8EedjNGcLGimHge/98yayerU+tDQMHyZqZikoh8wlV1utvlaC3xx9
	HuxL45Xg==;
Message-ID: <3dc73f745b6abfd1eb53e7d3fce2067eaa3b3c92.camel@infradead.org>
Subject: Re: [PATCH v7 17/36] KVM: x86: Allow KVM master clock mode when
 TSCs are offset from each other
From: David Woodhouse <dwmw2@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,  Borislav Petkov	 <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"	
 <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross	
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul
 Durrant	 <paul@xen.org>, Jonathan Cameron <jic23@kernel.org>, Sascha
 Bischoff	 <Sascha.Bischoff@arm.com>, Marc Zyngier <maz@kernel.org>, Joey
 Gouly	 <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, Dongli
 Zhang	 <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Date: Tue, 11 Aug 2026 22:00:21 +0100
In-Reply-To: <ants4VjfAiblaWsl@google.com>
References: <acd9b32617f75d188c370a464a922af0d650d4f5.camel@infradead.org>
		 <ano6-gIZtqMfipiD@google.com>
		 <bb9a12cc663130eb2caa8e839d0f6ca53d722d1c.camel@infradead.org>
		 <ansuqrD2KwFuLWbV@google.com> <ansywxh0VX5rtfWc@google.com>
		 <e256fa4af96e916ba30019cbba501fa896025fb0.camel@infradead.org>
		 <antQYJvRxJxOjtut@google.com>
		 <f5dc701cf3319a7b3c8fd1497f26d051aa9fa3ba.camel@infradead.org>
		 <antb01WqOrs-tztm@google.com>
		 <6ab49538675d97f1f4bf01574b1b066aae0bc05c.camel@infradead.org>
		 <ants4VjfAiblaWsl@google.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-2dTuJQhVZvx++cPPzOWu"
User-Agent: Evolution 3.60.3-0ubuntu1~ppa9~24.04 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-16d1c6/1786482041-F580D77B-D5299E7A/0/0
X-purgate-type: clean
X-purgate-size: 12725


--=-2dTuJQhVZvx++cPPzOWu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-08-11 at 11:41 -0700, Sean Christopherson wrote:
> OMG, I hate this code.=C2=A0 After literally hours of staring at this, an=
d even typing
> up a lengthy example of why guest time would go off the rails, I finally =
spotted
> that l1_tsc_offset is accounted for by the call to kvm_read_l1_tsc().=C2=
=A0 FML.
>=20
> Thanks for being patient and not flaming me too much :-)

Haha, no judgement. We *all* hate this code. That's why I threw my toys
out of the pram and went on this crusade to clean it up a bit.

> > > > And your variant just added a dependency on wallclock time back int=
o it
> > >=20
> > > Can you elaborate?=C2=A0 I'm guessing I don't entirely understand wha=
t you mean by
> > > wallclock time.
> >=20
> > The system_time field? The unspecified might-be-UTC-might-have-leap-sec=
onds one :)
>=20
> Ok, I think I finally understand the goal.=C2=A0 I got turned around by t=
he combination
> of the name SET_CLOCK_GUEST and the full pvclock structure being passed t=
o the
> guest.=C2=A0 I was expecting SET_CLOCK_GUEST to literally set the entire =
clock, e.g.
> mul+shift, timestamp, etc.

That's an implementation detail.=C2=A0

It is literally getting the clock as the guest sees it, and setting it
again on the destination from the same guest-ABI pvclock structure.
=46rom the userspace point of view those actions *are* symmetrical.
I'd actually *like* it to just be a memcpy at both ends, even on the
SET side, just copying what userspace provides into what we offer to
the guest as its pvclock.

But as well as wanting to do some sanity checking, we also live in a
world where we might have to switch to the non-masterclock mode at any
time, and we have to ingest the information into the per-VM kvmclock
setup in a way that the kernel "understands", and that's why it ends up
implemented the way it is.

I looked at rewriting the masterclock base information from what
userspace is providing, but there are *host* TSC values in there, and
it ended up in some cases wanting to set ka->master_cycle_now to a
value which is *negative* on the new host, and I didn't want to
exercise that wrap-around path. So instead we just adjust
ka->kvmclock_offset to give appropriate results based on the existing
masterclock base.

Each vCPU's pvclock is then *regenerated* from the VM-side kvmclock
data, giving rise to that annoying =C2=B11ns discrepancy that I whined abou=
t
a while back, but didn't give in to my perfectionism and eliminate...
yet.

As far as userspace is concerned, KVM_SET_CLOCK_GUEST *does* set the
entire clock (at least the relationship between guest TSC and kvmclock
nanoseconds, which is what it's for). It's just that the kernel then
"tweaks" it a little bit to give a slightly different y=3Dm(x-x')+c
equation which is still within the noise of the original.

And the kernel actually does that kind of 'tweak' all the time.
Although we're working on narrowing them down because "within the
noise" is in the eye of the beholder; Dongli had some patches for that
which I think I rounded up and included?

> But all of that metadata is just a means to an end: the one and only goal=
 is to
> calculate the per-VM kvmclock_offset for the "new" host's TSC+time snapsh=
ot, by
> computing the nanoseconds delta for the new snapshot as if it the guest o=
bserved
> the TSC while running on the old host.

That is currently how it is implemented. It isn't the API contract.

> And that is done in the kernel instead of in userspace to minimize the am=
ount of
> slop introduced due to delay between taking the snapshot and computing th=
e offset.

Huh? There should be no delays here. If *anything* in this new code is
done with something other than a *simultaneous* reading of TSC and
ktime that I sweated blood and tears and got shouted at by Thomas for,
then that *is* something I care about...

--=-2dTuJQhVZvx++cPPzOWu
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCE8Ew
ggWvMIIEl6ADAgECAhANkOKMSmGXhF5eMl0rsRhvMA0GCSqGSIb3DQEBDAUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjAeFw0yNDAzMTMwMDAwMDBaFw0zNDAz
MTIyMzU5NTlaMGIxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UE
AxMxRGlnaUNlcnQgQXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTCCAiIw
DQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOfSIeC0vv1xPQ+dgSxbIIrkaru6skAWJYaGFzmv
q4Kq+2wU2jxhcWlJg/JeP5jEkq/LM3pn5aaLao79j+XRmS7J1ZpJKUODJVoM4s9MQJhTMvo4qS5Z
S64g6QR7Obkz3I1Lr3aWeSBmDDEyzue+NKtuWZ1Cxy3RdXo/w5HgRc3l2AercOM3Gt1XonTzEtTb
Z/Hwc0Sn9Gz8RmGRK6Ka4hVDl8q/2l110KaV233Kh5etP0csXS8MIMdVRfRu3sc5hp13DG7lCKzK
72a2GEpI8Wpl26G6I1/LMzz/98T+FqjTqxsdquk7Cj7m2vKGLW1BorpQH7WFGPdJQXJe1hfbfiZA
CcVdCtl4nAacFacmsiArZBfX7AQGL7isvHUwwYFEtcApyGW4p2Lt+t8nvU0CANA6BHOpOz1xOP8W
mAESbUriIjyuTUf3fJ9oDNCurVqhASMJCDaWI3lYX/QAoiAzt6akqbbZxo2ujW7mGGqc0KxqE2cs
h2T79v7pC8aUtHBfwNrTR19GnZVxE0eQ7ViIQhR6mpSaUQFA9sG+cmD2G8TnCgYsLa0q8De6F61a
CBevQGHNzrbZ3JAMneveYg/Jy1XxQHDRcvrMfWKe0jjcWbdKYlaGVPm5V1ILwYz7Yv5ewo3NUrxI
GJiywe9qPhuJSDZs7VehTuI0FxGIsgKzVjgbAgMBAAGjggFcMIIBWDASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBT3m6JO05fF9DQPQw6Bhc6RkzKv+TAfBgNVHSMEGDAWgBTOw0q5mVXyuNtg
v6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMG
CCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURS
b290RzIuY3J0MEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdp
Q2VydEFzc3VyZWRJRFJvb3RHMi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUA
A4IBAQA+b8Uw53sDspdZgukU+qzLyyHkcjlxGGhHlP+zrmDLKm1wEFvCRS2pili3Hy67i8N4N5NU
vw5Rg6kv3lxb9S9Rktxk43k+tvm68pl7OxQE55ZjVY87P0lUPGwEqOOwLLyH02ZQcsfq5p5LrOH9
0JvmvZ1yy73HS+VpDAqOlytE0NSvTIRqFFkKQGQwfjvtql9YflujuNNvJztjBaHKYZsnNSg+J38o
jYq4TP3pSg3UdVH0PncVjPQyqxC9xef5Xae92Kbkzol3x7Nel3A1bwAkalrDMspvTHvey6LfiBks
FIqviTnoy7fgjaRAJgHS+RXx/cmuRd3rUAclSVVrYu8RMIIHAzCCBOugAwIBAgIQAzUotrsybJHx
HTjKOIVdIDANBgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
IEluYy4xOjA4BgNVBAMTMURpZ2lDZXJ0IEFzc3VyZWQgRzIgU01JTUUgUlNBNDA5NiBTSEEzODQg
MjAyNCBDQTEwHhcNMjYwNzE4MDAwMDAwWhcNMjgwMTA0MjM1OTU5WjAeMRwwGgYDVQQDDBNkd213
MkBpbmZyYWRlYWQub3JnMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2pYux73kdbYX
sWF8f1u6DJP91qcqaZetsyfPkZk0B+MmXmAEv0kVes5n15V2mbDThOnpoPFly0UugQO9JYqLfrtD
tKD5yL58fgrDB9Dw+LQikgrHafl6YSCds5AvUu/8hw2J6noKrcOLJpKlKn9Fl/4IB9Q3JIdLx5aa
EtTqMalIPqHFOlgrJ7s+aua8xbB8YQ9ahqYBXWRJNv3P/2b1DYtdrz1oqZPE3CcB8Pc6Gf2a1Tcm
6TAgtEx7Cf1BFcrsrMz7TWHmGQITieNb2r9UYWSc2Gp+GtYFNJCgT0JJXKUBIauPMKBLteYrL8Fo
ff/uY44dC/mDWjdCP/5x0qelPQjlBvWdHL5zvBTOj06rJ0m3HNI/hnIcDh0Qu2j9reb9rLVcdym6
bWmBM4uDEB8Zv9Ph0KTBFSy1IosyakuD1j1Os30EzjGfbi0EUXIvnOcYbTBAbM5UAzrxEHMhBvoX
Pvnx+OyvjJmc9tWxTX6AcSz+m40esbT17URBeZS18afgieiikm5TynlUYP1LciR3hSgGVzvGXnKO
02VDFR5itGWdRKZ2W5wIShNfWfhSa0D0K5UdIDt5Qc7sjzwK1Yb1sY5Tu0uA5mhIS82q1ov83uxB
sFkriNnhGv/M1NCDVLBiOMsHu73qUM+yKmgKLwF9Hfn9WI25glbAMI4S5r3hYzcCAwEAAaOCAfcw
ggHzMB8GA1UdIwQYMBaAFPebok7Tl8X0NA9DDoGFzpGTMq/5MB0GA1UdDgQWBBRcYhqbcGzn1jrT
JOZaB8O7qllDpzAwBgNVHREEKTAngRNkd213MkBpbmZyYWRlYWQub3JngRBkYXZpZEB3b29kaG91
LnNlMBQGA1UdIAQNMAswCQYHZ4EMAQUBAjAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYwFAYIKwYB
BQUHAwIGCCsGAQUFBwMEMIGpBgNVHR8EgaEwgZ4wTaBLoEmGR2h0dHA6Ly9jcmwzLmRpZ2ljZXJ0
LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsME2gS6BJ
hkdodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZT
SEEzODQyMDI0Q0ExLmNybDCBjQYIKwYBBQUHAQEEgYAwfjAkBggrBgEFBQcwAYYYaHR0cDovL29j
c3AuZGlnaWNlcnQuY29tMFYGCCsGAQUFBzAChkpodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20v
RGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZTSEEzODQyMDI0Q0ExLmNydDANBgkqhkiG9w0B
AQsFAAOCAgEAocabrh1cPd5s3vY5rnlBVQSTc7zs2ZWs67dAIltR+05WELrYClVzzUhMs/LOJPlr
EUo45UDDomXq38DxFepaPd9+iNLjXfn33EX/IG44j04lU/oF/Rg9VeQILkYLbCZ/x9wOjNHZc4SN
ydY7Dhvf/sT5aBz88u7D5+azZJ7Qf1U57wYseCH1Mt0nDrtr5y19IJ8D9xJJ33RFL6vfpHZBBAQ8
+3RqkKNxLoV2aFvQhxdhjNLDqTv3LjUIdicwPraN7JkxEu7CV2Lka7eRqJgkWL7SK0YmBjGpRafs
+icP/ON5RCCKTTb6VlX8eTG2sJJfsFhvJNCCt6xexbWzWtIrfP7NvPBvwBB737AyEGBZkS5aNizT
McURJGTv9UKvBh1LF/+tNhYtLvPCN7oecGzhCHht9jcwSkygTo3Y6YlK3QgOu+ncmiBbfeuwlLZ1
LxbYvG6hgNqXv7u6YyADbYajAQJXJ2OQen39pm3Q/AQSyLYG+B8lDglWsM8tYXPlEdrYJcksGK6F
nqIX6Bumn43rBooLJdiZp4WmfWdL2pxe+LxRDjprmqu1WprixDxULSTOKJZoqTlugs6y3Bc+if+s
gHnBBtz9WQ6MtPHkh7zONDAFIKcBmv8OqPQCx0F3Wv3OEybwMpXx0OsKgK8wLldaX1pXcMuyDgTL
Sqs0AV0OHUgwggcDMIIE66ADAgECAhADNSi2uzJskfEdOMo4hV0gMA0GCSqGSIb3DQEBCwUAMGIx
CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UEAxMxRGlnaUNlcnQg
QXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTAeFw0yNjA3MTgwMDAwMDBa
Fw0yODAxMDQyMzU5NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqG
SIb3DQEBAQUAA4ICDwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZe
YAS/SRV6zmfXlXaZsNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2z
kC9S7/yHDYnqegqtw4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qG
pgFdZEk2/c//ZvUNi12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41va
v1RhZJzYan4a1gU0kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0c
vnO8FM6PTqsnSbcc0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PW
PU6zfQTOMZ9uLQRRci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXt
REF5lLXxp+CJ6KKSblPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQr
lR0gO3lBzuyPPArVhvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7Iq
aAovAX0d+f1YjbmCVsAwjhLmveFjNwIDAQABo4IB9zCCAfMwHwYDVR0jBBgwFoAU95uiTtOXxfQ0
D0MOgYXOkZMyr/kwHQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3
bXcyQGluZnJhZGVhZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEC
MA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgakGA1UdHwSB
oTCBnjBNoEugSYZHaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZEcyU01J
TUVSU0E0MDk2U0hBMzg0MjAyNENBMS5jcmwwTaBLoEmGR2h0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNv
bS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsMIGNBggrBgEF
BQcBAQSBgDB+MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wVgYIKwYBBQUH
MAKGSmh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNB
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
6dY+E8WsXfRv6+oEY1vKX8IAAAAAAAA=


--=-2dTuJQhVZvx++cPPzOWu--


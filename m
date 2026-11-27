Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7198606A321
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=cIjYCpEM;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pK2clT0k
Received: from list by lists.xenproject.org with outflank-mailman.1505109.1700051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWwVT-00072Z-Rn; Fri, 27 Nov 2026 14:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505109.1700051; Fri, 27 Nov 2026 14:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWwVT-00072S-OY; Fri, 27 Nov 2026 14:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1505109;
 Fri, 27 Nov 2026 14:00:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xWwVS-00072M-Bn
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 14:00:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWwVR-00C5Kz-K1
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 15:00:53 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6b098d15-8faa-0a2a0a5109dd-0a2a45048f64-4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:00:53 +0100
Received: from [103.168.172.147] (helo=fout-a4-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6b098d14-b57f-0a2a45040019-67a8ac93ba01-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:00:53 +0100
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id E47B6EC0A47
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 09:00:51 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Fri, 27 Nov 2026 09:00:51 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 09:00:50 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1795788051; x=1795874451; bh=KD4nxzrTwF
	Zc/QouoX0LSpETIBhJmTU5upUErTkKWJw=; b=cIjYCpEM+CigNuAvxheLOQ4vKn
	EaUqr0uBcdYhD9i6uq646PQ99uv46S2JVYoYHDSc4Jytf3Ag2+au3fzyUd/KJzi5
	WjGIpDJ6peCXactgLsQbTzAJOYRaiysetG8mDXMwSrq9Uzpb4avbLolBRQ7ZDx1O
	s7aMT+/OGagpsGy9nGYDEMEJTk/oQ+4e6tosqkBytuI99PFJA+18jEf8HtIVvgX1
	bcSS8A84kkGmGdCbQKvoiB2mKXZCg3n/Zpk8+Jtg7AH9mh2ry9mnKks1awerGQUz
	OVIPIKca6qADFsVkQXZChb5F7lG/9Vczl1iFL3vDvPt0FEbzc20Y11bXUN6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795788051; x=
	1795874451; bh=KD4nxzrTwFZc/QouoX0LSpETIBhJmTU5upUErTkKWJw=; b=p
	K2clT0kPwDP0RLp5/84sc9qQFFGHMrGXAIsgOaoHWfBQYmu3c2BE+LewjU5smMU9
	VG5g8KYZcXDKLLS+/yxlj6fq3mXw/o5v7UIcwCN6h5wnf2Ie4bQvKJaIfBFHXGuG
	+iKu0e52eMbGffCXo/WRd3rSl7AAKqXbr8gx6SqmLMFRT8nXzCPZEN6LMtb15wLr
	APRukSvYzwiV1c+3EughVYXB3S1LUC6Xi1d/wkTzmgRXPkNWhN4UM/6y56zfUsl4
	IvBw99eRkWN0/UDWz9SUhy/9zJznLFmymCwExhzotnkwAUaAf/159AyGw3O5KTbn
	Fg5tGNzMYXXT2/yohh68Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795788051; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm3:rsa-sha256:iuPta0JwtYN8ouqPJ/vpXM/jJX1zuEz+M40Mq19r/pTN5Ec
	f36z/tY/hgQ6TfXM5cXJtMTB1HtXcih1GasP9XyBUagp44KTBiuMGAEHuK6rIvck
	HyGE1qadEXALYoWTwrnouInT8NBJ1lygNDOJngIOE+SIpT1tYtu/I+xNxPeMtT1C
	2w3NKUw22QjBTSsNW32p4YwbGGg+/ifgZ3F8Uki9QpJ/xNS712bblG4oyXlDZM8c
	zdzWF4KdpgwjIXdIBUNYvO+4cRxGuJUviEVGHd+TZzNc+/5EyIatZZ2468Nehdst
	QleAcfrJUCRSVJ28UYPo6S9CkfHaqTNKYG2ySUQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=content-disposition,content-type,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:1nze9qCrLMzOr73h71KmcXZVIBmQYxeXWK40WG9BcW0=:KD4nxzrTwFZc/QouoX0LSpETIBhJmTU5upUErTkKWJw=;
X-ME-Sender: <xms:E40Ja7eDw7vr-mt1ZgYBivLSJ38Uq0sjxYm7I_97s7SSW9o5ENt79Q>
    <xme:E40Ja4KT6V8pJwfFXKj3fDlviwdH29r3mqU43lUbx4f9YG0I3q4ldZj9WAXbGsYhs
    Kj8lNL-xW0Zsz1Y2zCf3m6nfW8Kx1MbK3Pr_YZDzS5Wc7bSX1A>
X-ME-Received: <xmr:E40Ja6IF9eQZ80gbrVm_Xa_USFN6bz3hLZmkHzUZltvzcNZTS3g7H5PKJoj7rsFS3jbwoqbIzmNHsj9oJ1cgbz5ffgGaURMTJeTdrIw3Ces>
X-ME-Proxy-Cause: dmFkZTGwBGNhQJYJz8uYAS81gIoLhhbfvnrhh6ZF/+/KVN28xZCxk4a3I9P8npbNf6s8hg
    l2c6JqNhusgFxHL90PfJwZAc998EaHMCz67jo7YWYli+SC8N4s8o2qBDp8C7w8iHAbQ68w
    xJOv1CYTYMa8ZM3R8UEhyQNerN/5u8xsbFzWvnxOn1I0ryCVQQdNi3hsQ78HENOnTcoZe3
    jB2oulB4znccNWr3Ig7IrXUlOHFGhOepFvd4H/9VzB3gS25kqzTxN4xDVzRTNOV52J4ctk
    p2m9ykkygQ9t3fqrMqTyGif2ifSUe2HO1QYym1M1R3++9ghCpry91LPGRpNFiad8ZiVunh
    +QlUovk2yuawMjKMWzq1e4wH8UhrKrZYBHBs6aEW9aSHGibyIOPIeNgTPpi0KfEzSv3fiW
    5Dnb169SHbz4fjcGfkKCV48ijwVcQ7xBmjlb7bW5ZXhrBP5ogfEks7uUwjXHzpxS3eOS3Y
    ifYL6W2+aIIFligXRD8BUtk45hVfEK/Mc3Fy+9buWgy28oCoFDnh46TmiTfz3slk2T4Eup
    k4Qky83UW+fknkYeNqh/BeT/+qGU2zAd4bPsJJiVZsDLUjFfXAS0McQxx8fdGYwZGEVt3C
    N3EoqxgxcHBtAq2Q1GK2LR9YVBL+iwLIoEOZMgmghiOsFHBE8Jl0qJ0IB9Zw
X-ME-Proxy: <xmx:E40JayFzMLWJll-wzrhTDrheKMCVHHzTJ42iNwBEvWmps9YsoE8hTQ>
    <xmx:E40Ja3mgoQ5yd8zyAwn6jwFRCCclv5uRN3qJwEO7NQF8w3ebA3k8LQ>
    <xmx:E40Ja3L2NBDO_t9eqRqhNTllnB4iUO-cNxf01NQTveTibWZADPo8Ow>
    <xmx:E40JawZkDphPk7q6F6TpuS3X4iPWinc0rUHzb7s8TqeV9tpD-xfIcg>
    <xmx:E40Ja5UhRrtQ75Aiqnysg204ppTbpsqJ8yFS3dooI81KEckANoQsVB2T>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 27 Nov 2026 15:00:48 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Firmware-enabled split-lock detection causes later crashes in HVM
 domU
Message-ID: <awmNEIRH1GHGpYDl@mail-itl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g/YFT5zTD9c4R+zb"
Content-Disposition: inline
X-purgate-ID: tlsNG-ebf023/1795788053-508D9B50-B6C3D7A3/0/0
X-purgate-type: clean
X-purgate-size: 4480
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--g/YFT5zTD9c4R+zb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 15:00:48 +0100
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Firmware-enabled split-lock detection causes later crashes in HVM
 domU

Hi,

I'm forwarding analysis I've got in qubes issues. Looks like something
that either Xen should turn off, or handle better (as KVM and VirtualBox
supposedly do).

----- Forwarded message -----

hippalectryon-0 left a comment (QubesOS/qubes-issues#11300)

@loftlifter31 Thanks for the logs. This is probably not memory corruption. =
The three crashes with parameters (dump2, dump3 and the one in hypervisor.l=
og) all fail at the same instruction with the same second parameter across =
separate boots, and dump2 and dump3 show `nt!KiAlignmentFault` (the alignme=
nt fault handler) on the stack. dump1 has the same fault code, in `KiInsert=
QueueDpc` (its stack is cut short). On x86, normal alignment checks only ap=
ply to user mode, so an alignment fault in kernel mode points to split-lock=
 detection: the CPU traps a locked access that crosses a cache line. Xen pa=
sses that trap into the guest, and Windows crashes. KVM (in its default mod=
e) handles it on the host instead, and VirtualBox seems to as well, which w=
ould explain why Windows runs fine in VirtualBox on Debian.

Xen never turns split-lock detection off, so whatever turned it on before X=
en started stays in effect. My guess is Heads: it boots Linux first, then k=
execs into Xen. Linux turns split-lock detection on by default on Tiger Lak=
e, Alder Lake and Raptor Lake, and doesn't turn it off before kexec. The `s=
plit_lock_detect=3Doff` you added goes to the dom0 kernel, which can't chan=
ge this setting under Xen. This would fit the forum reports (Alder/Raptor L=
ake on Dasharo+Heads), though one of them says Dasharo UEFI crashed too, so=
 Heads may not be the only way it gets turned on.

Could you try, in order:

1. In any Linux qube (no reboot needed), run:
```
timeout 10 python3 -c 'import mmap,ctypes as c
m=3Dmmap.mmap(-1,4096,prot=3D7);m.write(bytes.fromhex("f0480fba2f00c3"))
f=3Dc.CFUNCTYPE(None,c.c_void_p)(c.addressof(c.c_char.from_buffer(m)))
b=3Dc.create_string_buffer(256);f((c.addressof(b)+63)//64*64+60);print("no =
split-lock #AC")'; echo "exit: $?"
```
It does one locked write across a cache line. If it prints `no split-lock #=
AC`, split-lock detection is likely off and my theory is likely wrong. If i=
t hangs until the timeout (exit 124) or dies with a bus error, it is on; `s=
udo dmesg | grep -i split_lock` in that qube should then show a `took a spl=
it_lock trap` line.
2. In the Heads recovery shell, `dmesg | grep -i split` and paste whatever =
it prints. This shows whether Heads' Linux turned it on.
3. If you can rebuild Heads, add `split_lock_detect=3Doff` to the Heads ker=
nel command line (`CONFIG_LINUX_COMMAND_LINE` in your board's coreboot conf=
ig), reflash, and see if the BSODs stop.

If this is confirmed, the imo fix probably belongs in Xen (turn split-lock =
detection off at boot), not in Heads. The microcode difference (0xbe under =
Xen, 0xb8 under Debian) is probably unrelated. `xl dmesg` confirms Xen is s=
tarted via kexec from Heads.

--=20
Reply to this email directly or view it on GitHub:
https://github.com/QubesOS/qubes-issues/issues/11300#issuecomment-7207667716
You are receiving this because you are subscribed to this thread.

Message ID: <QubesOS/qubes-issues/issues/11300/7207667716@github.com>

----- End forwarded message -----

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--g/YFT5zTD9c4R+zb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmsJjRAACgkQ24/THMrX
1ywXDAf/fvKWlJGBW/1KZEwEfoRYsaLdHyGhkdT+Fs0GRraj9JYV3eB2thNayh1T
n0ovVDlfGkYqyW5kG0ZgMloyj1tX/ct8Ksftn4nhW67+2imDESrhz7WOlf9xeR1p
z9Rt8DDxSjS/RDYVxBwxUEkB8lK/d6L8BcGmcDYwkunfFMAjRjuCW6PWDG9CuIlA
gwW27Iduz/YgywQw2DD18Lpp+WJETYUbdO4lw+yGdm7hs2bluGkdd3XA6ae2b8Jo
78ofj/opD4Z3ygYCVLRwaUBQixatJ0S1OyquPCCMm1fl74zTXr7u3YJsnK1f7WFl
B4IpM3hmhWJABVa7cpFbAkD/YvDm2w==
=jcuG
-----END PGP SIGNATURE-----

--g/YFT5zTD9c4R+zb--


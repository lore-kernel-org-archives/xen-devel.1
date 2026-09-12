Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8212DC88E59
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 13:45:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1418615.1646492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5O26-0003Oq-35; Sat, 12 Sep 2026 13:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1418615.1646492; Sat, 12 Sep 2026 13:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5O25-0003Oj-Vo; Sat, 12 Sep 2026 13:44:41 +0000
Received: by outflank-mailman (input) for mailman id 1418615;
 Sat, 12 Sep 2026 12:56:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <md.career@protonmail.com>) id 1x5NHf-000466-Vi
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 12:56:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5NHf-00BgYO-5K
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 14:56:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <md.career@protonmail.com>)
 id 6aa54c0a-8faa-0a2a0a5109dd-0a2a450ced64-2
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 14:56:43 +0200
Received: from [185.70.43.16] (helo=mail-4316.protonmail.ch)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <md.career@protonmail.com>)
 id 6aa54c0a-f479-0a2a450c0019-b9462b10c2b7-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 14:56:42 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=protonmail3 header.d=protonmail.com header.i="@protonmail.com" header.h="Date:To:From:Subject:Message-ID:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789217802; x=1789477002;
	bh=D4OWyTsDVzo2NGC3lKqpcDybE2xK9tUo2nmC2bhQb5Y=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Gh3zjDhxy2nGqPZqRwS/mumwEnHguLf4zp5FjVf9p/qj/iNG50bcolMJirbKRo6aG
	 cChgtN7w+TiFmnamliO6CnLk5V8RYQ/5vDkE4vC5lo5XI+vsKhqNDM2TfJzJsUFk/j
	 Q0+/D8L5N51IfjmcaKy+1bo7j03fcrOGDZX9k6b5rqTpDNhiyJuuOdOWIs02QC1zQD
	 LniDKTP49YpO7r6U8buMVuRb3ZDUkoPXaN7rIZ8kuZz43u9T5vw5CyxfbGwS99uz85
	 Edgo3eu5t4t4KsEFpnJOvTp1URMEbIP0oZdH8GhkoKH+yOWooNEFr9mRsKQK40D1ZD
	 5D2xROnOEh8dw==
Date: Sat, 12 Sep 2026 12:56:38 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: "Mr. Hoorn" <md.career@protonmail.com>
Subject: [BUG] Intel Alder Lake guest PMU unusable because Xen vPMU rejects IA32_PERF_GLOBAL_CTRL bit 48
Message-ID: <krrWCHqvShbaZYcYWMN0UrK7hM73R53n6wh5hJLDkeoB1X_JCzrwR6e-1VVnFvh1rGjfXrBnbazIRVEr13ARHETQRr9LYb7dBP8KmLcSzgI=@protonmail.com>
Feedback-ID: 94398300:user:proton
X-Pm-Message-ID: e2c7ef42a9edbca65ad07d0df776abe06d49d547
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------44d65609ae32a4bf0b95bb7897e1da438361b4c395c64a0eb5ba6a5b45c9b2b9"; charset=utf-8
X-purgate-ID: tlsNG-d25034/1789217803-51D34A5B-0CA906C7/0/0
X-purgate-type: clean
X-purgate-size: 11412

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------44d65609ae32a4bf0b95bb7897e1da438361b4c395c64a0eb5ba6a5b45c9b2b9
Content-Type: multipart/mixed;boundary=---------------------5da0b490f0369cef87e96a53d2e851bb

-----------------------5da0b490f0369cef87e96a53d2e851bb
Content-Type: multipart/alternative;boundary=---------------------0815f646da1876f4f0ce62e76cb8df06

-----------------------0815f646da1876f4f0ce62e76cb8df06
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,
I have isolated what appears to be an incompatibility between Xen's Intel =
vPMU implementation and Linux's Alder Lake hybrid PMU initialization.

Host:

Qubes OS
Xen 4.17.5
vpmu=3D1
/sys/hypervisor/pmu/pmu_mode =3D self
/sys/hypervisor/pmu/pmu_features =3D 0x0

Guest:

PVH
Fedora 43
Linux 7.0.11 (also reproduced with 6.12)
Alder Lake hybrid PMU detected

With an unmodified kernel, Linux reports:

Performance Events: Alderlake Hybrid events, Intel PMU driver.

but then faults while enabling the P-core PMU:

unchecked MSR access error: WRMSR to 0x38f
tried to write 0x000100070000003f
__intel_pmu_enable_all

0x38f is IA32_PERF_GLOBAL_CTRL. The failing value contains bit 48 (GLOBAL_=
CTRL_EN_PERF_METRICS).

On Alder Lake, Linux explicitly enables this for the hybrid_big PMU in arc=
h/x86/events/intel/core.c:

} else if (pmu->pmu_type & hybrid_big) {
=C2=A0 =C2=A0 pmu->intel_cap.perf_metrics =3D 1;

Xen 4.17's Intel vPMU appears not to include bit 48 in the accepted global=
 control mask and consequently rejects the MSR write.

The practical result is that ordinary hardware counters are also unusable.=
 For example, perf stat reported zero cycles/instructions.

As a diagnostic workaround I built Linux 7.0.11 with only:

pmu->intel_cap.perf_metrics =3D 1;

changed to:

pmu->intel_cap.perf_metrics =3D 0;

After booting that kernel, the WRMSR fault disappears completely and ordin=
ary PMU counters immediately work:

12,228,346,996 =C2=A0cpu_core/cycles/
27,471,544,939 =C2=A0cpu_core/instructions/

A repeated run produced approximately the same instruction count and sensi=
ble cycle counts.

So the issue appears causal: Linux enables Alder Lake P-core PERF_METRICS =
through IA32_PERF_GLOBAL_CTRL[48], Xen rejects that bit, and PMU initializ=
ation is effectively broken as a consequence.

I have not yet tested current xen.git, so this may already have been addre=
ssed after 4.17. Is bit 48 / Intel PERF_METRICS supported by the current v=
PMU implementation? If not, I think Xen should either virtualize it or exp=
ose PMU capabilities such that the guest does not attempt to enable it.

I can provide further traces or test a Xen patch if useful.

Fine regards, Met vriendelijke groeten,Matthew David van der Hoorn

LinkedIn
Sent with Proton Mail secure email.
-----------------------0815f646da1876f4f0ce62e76cb8df06
Content-Type: multipart/related;boundary=---------------------62923c56b07a9ca5937ce2978d44e15a

-----------------------62923c56b07a9ca5937ce2978d44e15a
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48c3Bhbj5IaSw8L3NwYW4+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bhbj5JIGhhdmUgaXNv
bGF0ZWQgd2hhdCBhcHBlYXJzIHRvIGJlIGFuIGluY29tcGF0aWJpbGl0eSBiZXR3ZWVuIFhlbidz
IEludGVsIHZQTVUgaW1wbGVtZW50YXRpb24gYW5kIExpbnV4J3MgQWxkZXIgTGFrZSBoeWJyaWQg
UE1VIGluaXRpYWxpemF0aW9uLjwvc3Bhbj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFu
Pkhvc3Q6PC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4+UXViZXMgT1M8L3Nw
YW4+PC9kaXY+PGRpdj48c3Bhbj5YZW4gNC4xNy41PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+dnBt
dT0xPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+L3N5cy9oeXBlcnZpc29yL3BtdS9wbXVfbW9kZSA9
IHNlbGY8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4vc3lzL2h5cGVydmlzb3IvcG11L3BtdV9mZWF0
dXJlcyA9IDB4MDwvc3Bhbj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuPkd1ZXN0Ojwv
c3Bhbj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuPlBWSDwvc3Bhbj48L2Rpdj48ZGl2
PjxzcGFuPkZlZG9yYSA0Mzwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPkxpbnV4IDcuMC4xMSAoYWxz
byByZXByb2R1Y2VkIHdpdGggNi4xMik8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5BbGRlciBMYWtl
IGh5YnJpZCBQTVUgZGV0ZWN0ZWQ8L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bh
bj5XaXRoIGFuIHVubW9kaWZpZWQga2VybmVsLCBMaW51eCByZXBvcnRzOjwvc3Bhbj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuPlBlcmZvcm1hbmNlIEV2ZW50czogQWxkZXJsYWtlIEh5
YnJpZCBldmVudHMsIEludGVsIFBNVSBkcml2ZXIuPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+PHNwYW4+YnV0IHRoZW4gZmF1bHRzIHdoaWxlIGVuYWJsaW5nIHRoZSBQLWNvcmUgUE1V
Ojwvc3Bhbj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuPnVuY2hlY2tlZCBNU1IgYWNj
ZXNzIGVycm9yOiBXUk1TUiB0byAweDM4Zjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPnRyaWVkIHRv
IHdyaXRlIDB4MDAwMTAwMDcwMDAwMDAzZjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPl9faW50ZWxf
cG11X2VuYWJsZV9hbGw8L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bhbj4weDM4
ZiBpcyBJQTMyX1BFUkZfR0xPQkFMX0NUUkwuIFRoZSBmYWlsaW5nIHZhbHVlIGNvbnRhaW5zIGJp
dCA0OCAoR0xPQkFMX0NUUkxfRU5fUEVSRl9NRVRSSUNTKS48L3NwYW4+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj48c3Bhbj5PbiBBbGRlciBMYWtlLCBMaW51eCBleHBsaWNpdGx5IGVuYWJsZXMg
dGhpcyBmb3IgdGhlIGh5YnJpZF9iaWcgUE1VIGluIGFyY2gveDg2L2V2ZW50cy9pbnRlbC9jb3Jl
LmM6PC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4+fSBlbHNlIGlmIChwbXUt
Jmd0O3BtdV90eXBlICZhbXA7IGh5YnJpZF9iaWcpIHs8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4m
bmJzcDsgJm5ic3A7IHBtdS0mZ3Q7aW50ZWxfY2FwLnBlcmZfbWV0cmljcyA9IDE7PC9zcGFuPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4+WGVuIDQuMTcncyBJbnRlbCB2UE1VIGFwcGVh
cnMgbm90IHRvIGluY2x1ZGUgYml0IDQ4IGluIHRoZSBhY2NlcHRlZCBnbG9iYWwgY29udHJvbCBt
YXNrIGFuZCBjb25zZXF1ZW50bHkgcmVqZWN0cyB0aGUgTVNSIHdyaXRlLjwvc3Bhbj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuPlRoZSBwcmFjdGljYWwgcmVzdWx0IGlzIHRoYXQgb3Jk
aW5hcnkgaGFyZHdhcmUgY291bnRlcnMgYXJlIGFsc28gdW51c2FibGUuIEZvciBleGFtcGxlLCBw
ZXJmIHN0YXQgcmVwb3J0ZWQgemVybyBjeWNsZXMvaW5zdHJ1Y3Rpb25zLjwvc3Bhbj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuPkFzIGEgZGlhZ25vc3RpYyB3b3JrYXJvdW5kIEkgYnVp
bHQgTGludXggNy4wLjExIHdpdGggb25seTo8L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj48c3Bhbj5wbXUtJmd0O2ludGVsX2NhcC5wZXJmX21ldHJpY3MgPSAxOzwvc3Bhbj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuPmNoYW5nZWQgdG86PC9zcGFuPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+PHNwYW4+cG11LSZndDtpbnRlbF9jYXAucGVyZl9tZXRyaWNzID0gMDs8L3Nw
YW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bhbj5BZnRlciBib290aW5nIHRoYXQga2Vy
bmVsLCB0aGUgV1JNU1IgZmF1bHQgZGlzYXBwZWFycyBjb21wbGV0ZWx5IGFuZCBvcmRpbmFyeSBQ
TVUgY291bnRlcnMgaW1tZWRpYXRlbHkgd29yazo8L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj48c3Bhbj4xMiwyMjgsMzQ2LDk5NiAmbmJzcDtjcHVfY29yZS9jeWNsZXMvPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+MjcsNDcxLDU0NCw5MzkgJm5ic3A7Y3B1X2NvcmUvaW5zdHJ1Y3Rpb25z
Lzwvc3Bhbj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuPkEgcmVwZWF0ZWQgcnVuIHBy
b2R1Y2VkIGFwcHJveGltYXRlbHkgdGhlIHNhbWUgaW5zdHJ1Y3Rpb24gY291bnQgYW5kIHNlbnNp
YmxlIGN5Y2xlIGNvdW50cy48L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bhbj5T
byB0aGUgaXNzdWUgYXBwZWFycyBjYXVzYWw6IExpbnV4IGVuYWJsZXMgQWxkZXIgTGFrZSBQLWNv
cmUgUEVSRl9NRVRSSUNTIHRocm91Z2ggSUEzMl9QRVJGX0dMT0JBTF9DVFJMWzQ4XSwgWGVuIHJl
amVjdHMgdGhhdCBiaXQsIGFuZCBQTVUgaW5pdGlhbGl6YXRpb24gaXMgZWZmZWN0aXZlbHkgYnJv
a2VuIGFzIGEgY29uc2VxdWVuY2UuPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNw
YW4+SSBoYXZlIG5vdCB5ZXQgdGVzdGVkIGN1cnJlbnQgeGVuLmdpdCwgc28gdGhpcyBtYXkgYWxy
ZWFkeSBoYXZlIGJlZW4gYWRkcmVzc2VkIGFmdGVyIDQuMTcuIElzIGJpdCA0OCAvIEludGVsIFBF
UkZfTUVUUklDUyBzdXBwb3J0ZWQgYnkgdGhlIGN1cnJlbnQgdlBNVSBpbXBsZW1lbnRhdGlvbj8g
SWYgbm90LCBJIHRoaW5rIFhlbiBzaG91bGQgZWl0aGVyIHZpcnR1YWxpemUgaXQgb3IgZXhwb3Nl
IFBNVSBjYXBhYmlsaXRpZXMgc3VjaCB0aGF0IHRoZSBndWVzdCBkb2VzIG5vdCBhdHRlbXB0IHRv
IGVuYWJsZSBpdC48L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bhbj5JIGNhbiBw
cm92aWRlIGZ1cnRoZXIgdHJhY2VzIG9yIHRlc3QgYSBYZW4gcGF0Y2ggaWYgdXNlZnVsLjwvc3Bh
bj48L2Rpdj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7
IGZvbnQtc2l6ZTogMTRweDsiPjxicj48L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFy
aWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7IiBjbGFzcz0icHJvdG9ubWFpbF9zaWdu
YXR1cmVfYmxvY2sgIj4KICAgIDxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2Nr
LXVzZXIgIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMt
c2VyaWY7IGZvbnQtc2l6ZTogc21hbGw7IGNvbG9yOiByZ2IoMzQsIDM0LCAzNCk7Ij5GaW5lIHJl
Z2FyZHMsIE1ldCB2cmllbmRlbGlqa2UgZ3JvZXRlbiw8L3NwYW4+PGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6IEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogc21hbGw7IGNv
bG9yOiByZ2IoMzQsIDM0LCAzNCk7Ij5NYXR0aGV3IERhdmlkIHZhbiBkZXIgSG9vcm48L2Rpdj48
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9u
dC1zaXplOiBzbWFsbDsgY29sb3I6IHJnYigzNCwgMzQsIDM0KTsiPjxicj48L2Rpdj48ZGl2IHN0
eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiBzbWFsbDsgY29sb3I6IHJnYigzNCwgMzQsIDM0KTsiPjxhIGhyZWY9Imh0dHBzOi8vd3d3Lmxp
bmtlZGluLmNvbS9pbi9tYXR0aGV3LXZhbi1kZXItaG9vcm4tYjg5ODc1MjE4LyIgdGFyZ2V0PSJf
YmxhbmsiIHN0eWxlPSJjb2xvcjogcmdiKDE3LCA4NSwgMjA0KTsiPkxpbmtlZEluPC9hPjwvZGl2
PjwvZGl2PgogICAgCiAgICAgICAgICAgIDxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJl
X2Jsb2NrLXByb3RvbiI+CiAgICAgICAgU2VudCB3aXRoIDxhIGhyZWY9Imh0dHBzOi8vcHJvdG9u
Lm1lL21haWwvaG9tZSIgdGFyZ2V0PSJfYmxhbmsiPlByb3RvbiBNYWlsPC9hPiBzZWN1cmUgZW1h
aWwuCiAgICA8L2Rpdj4KPC9kaXY+Cg==
-----------------------62923c56b07a9ca5937ce2978d44e15a--

-----------------------0815f646da1876f4f0ce62e76cb8df06--

-----------------------5da0b490f0369cef87e96a53d2e851bb
Content-Type: application/pgp-keys; filename="publickey - md.career@protonmail.com - 0x4FCD90CD.asc"; name="publickey - md.career@protonmail.com - 0x4FCD90CD.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - md.career@protonmail.com - 0x4FCD90CD.asc"; name="publickey - md.career@protonmail.com - 0x4FCD90CD.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FWlhCYnRoWUpLd1lCQkFI
YVJ3OEJBUWRBR2xoeUt2dDd6MTZMR05CL3JUOUpKMG10QjYzTks1S2sKWFhkWmFJcnN1bHpOTTIx
a0xtTmhjbVZsY2tCd2NtOTBiMjV0WVdsc0xtTnZiU0E4YldRdVkyRnlaV1Z5ClFIQnliM1J2Ym0x
aGFXd3VZMjl0UHNLTUJCQVdDZ0ErQllKbGNGdTJCQXNKQndnSmtObWdWd2xhRzdqbwpBeFVJQ2dR
V0FBSUJBaGtCQXBzREFoNEJGaUVFVDgyUXpjTjFKMldCRlZHQTJhQlhDVm9idU9nQUFDNlQKQVA0
bjV5NSsySUZpakMzZDQwSTlwd2NYUCtnUVE5cXVaZk9PYktzRkFnTVV0QUVBelkrTXlQUGxHTVcy
CmN4TGRJOEl4K0ZtWWtGN1Z5dzNzZ2J0Vy8yNzlpUVBPT0FSbGNGdTJFZ29yQmdFRUFaZFZBUVVC
QVFkQQoreDhTVmlkdENRNGVBUWt3MzNXM2RBcUZjMGd1eDZDWElmdXQxWEZzYURnREFRZ0h3bmdF
R0JZSUFDb0YKZ21Wd1c3WUprTm1nVndsYUc3am9BcHNNRmlFRVQ4MlF6Y04xSjJXQkZWR0EyYUJY
Q1ZvYnVPZ0FBSDFICkFRQ0piMmhKcDVRQmZpczEvMHFzSXE1cWZyY3RWcXJHUk9XMGNBZHVkcDc2
eXdEL2RaWXF2M2doSmVpMgo1ZWQ4bzZNZlcybzhuMTlCTmJWQ1FyV1NwbXk5dGdjPQo9Y2ZXWAot
LS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCg==
-----------------------5da0b490f0369cef87e96a53d2e851bb--

--------44d65609ae32a4bf0b95bb7897e1da438361b4c395c64a0eb5ba6a5b45c9b2b9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmqlS/gJENmgVwlaG7joRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmd6g0/58lezat8a4rDKQIsJpBW2Zfhmrv8pbWSi
n6+fHBYhBE/NkM3DdSdlgRVRgNmgVwlaG7joAAB9tgD+KMv3UZSagrTI1/Ti
PJk9fjvu4EHJgE3S7QyEL3323fcA/3hLn53Yvqhin3gP3phC60lzCswY87Nb
NozhG41vEKsM
=CaU5
-----END PGP SIGNATURE-----


--------44d65609ae32a4bf0b95bb7897e1da438361b4c395c64a0eb5ba6a5b45c9b2b9--



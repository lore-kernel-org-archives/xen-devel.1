Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A7360A260A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Gd2XuIcn
Received: from list by lists.xenproject.org with outflank-mailman.1463498.1674350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM7HP-0004Qf-Nh; Wed, 28 Oct 2026 17:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463498.1674350; Wed, 28 Oct 2026 17:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM7HP-0004QY-Iw; Wed, 28 Oct 2026 17:17:39 +0000
Received: by outflank-mailman (input) for mailman id 1463498;
 Wed, 28 Oct 2026 17:17:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a183846ddc000f79f@swg.vates.tech>)
 id 1xM7HO-0004QR-78
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 17:17:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM7HN-00As1T-K0
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 18:17:37 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a183846ddc000f79f@swg.vates.tech>)
 id 6ae22e12-2eae-0a2a0a5409dd-0a2a4507c716-46
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 18:17:37 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a183846ddc000f79f@swg.vates.tech>)
 id 6ae22e31-b4ea-0a2a45070019-b9ff1c2398bb-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 18:17:37 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a183846ddc000f79f.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Oct 2026 17:17:36 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id D0D7382407
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 18:17:35 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=64hFIy1A9jY1l5sWb0csc2BO07MAPXCthO1pwQHNXQs=;
 h=from:subject:date:message-id:to:mime-version:content-type:feedback-id;
 b=Gd2XuIcnhxfMrgp/NvyE6jdMXfZDxmYy7KK60IS02lJhbi9t91UWC3wpG6g1OOjOUuC7k0Fke
 eWmuoj4AmcMgLeZKOfDwFn291tookDJfghNXJrK/a9ZBRs3ElIEqr2l/3i4DIPHxJWmrMTIVBp1
 yoBTIe92s86mlfInyyiWheGz4ZPrCusWMHzwxKm9glEOi4YNloz7EQQ2/1fY2hOB0W2/Yfwz5ko
 CnRAU5S2Z6k6fySxyp+2mwBf/6KpMUy/enFg2DFATMi0qPegTAlsrUfwEHA30i8ySt6vkynDVL2
 a1/MVAIsTPlz+LdmPiKQOgMvWkrPlx5cvd3PDts+4gHw==
X-Zone-Loop: 764a45984dcfb31de9aba8b3dd3ee891c9eba12c0c0e
x-campaign-type: default
x-transaction-id: 37271e25-392f-44da-bc21-741495d065ee
x-swg-uid: 01-f482ac1b-8cac-4524-bdf6-864d155b63e6
X-Mailer: Sweego
Message-ID:
 <1793207856.8631fc262581453bbf619ec5b2062170.1a183846ddc000f79f@vates.tech>
x-swg-bid: 1793207856.8631fc262581453bbf619ec5b2062170.1a183846ddc000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 28 Oct 2026 18:17:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC] vPMU rework proposal
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ima0ajx30A7vZprovN80ysg0"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793207855900
X-purgate-ID: tlsNG-ef75cf/1793207857-362C4AE4-7F633ECC/0/0
X-purgate-type: clean
X-purgate-size: 9285
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ima0ajx30A7vZprovN80ysg0
Content-Type: multipart/mixed; boundary="------------EDqgBOM9ETMq8NSGw8NY1l2o";
 protected-headers="v1"; hp="clear"
Message-ID: <dcb96e50-4424-414b-9e8a-d4331f4e9dde@vates.tech>
Date: Wed, 28 Oct 2026 18:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC] vPMU rework proposal
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa

--------------EDqgBOM9ETMq8NSGw8NY1l2o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkFzIG9mIHRvZGF5LCB2UE1VIGlzIHF1aXRlIGRpZmZpY3VsdCB0byB1c2Ug
Zm9yIHByb2ZpbGluZyB0aGUgc3lzdGVtLCANCmFuZCBoYXMgdmFyaW91cyBpc3N1ZXMuIE9u
ZSBpbiBwYXJ0aWN1bGFyIGlzIGxhY2sgb2Ygc3RhY2t0cmFjZSBzdXBwb3J0IA0KKFsxXSBl
eGlzdHMsIGJ1dCBpcyBjb21wbGljYXRlZCBwYXJ0bHkgZHVlIHRvIEFCSSBzaG9ydGNvbWlu
Z3MsIGFuZCBoYXMgDQpsaW1pdGF0aW9ucykuDQoNClRoZSBpZGVhIGhlcmUgaXMgcmF0aGVy
IHRoYW4gZXhwYW5kaW5nIHRoZSBjdXJyZW50IGRlc2lnbiB3b3VsZCBiZSB0byANCm1ha2Ug
YSBtYWpvciByZXdvcmsgb2YgdGhlIGZlYXR1cmUsIGNvbnNpZGVyaW5nIHNpZ25pZmljYW50
bHkgdGhlIEFCSSANCihpLmUgaW5jcmVhc2luZyBYRU5QTVVfVkVSX01BSikgYW5kIHNpbXBs
aWZ5IHRoZSBkZXNpZ24uDQoNCkEgaW1wb3J0YW50IHVzZS1jYXNlIG9mIHZQTVUgaXMgdG8g
cHJvZmlsZSB0aGUgZW50aXJlIHN5c3RlbSAoaW5jbHVkaW5nIA0KWGVuIGl0c2VsZiksIHdo
aWNoIGlzIG9ubHkgcG9zc2libGUgaWYgdGhlIFBNVSBjb3ZlcnMgdGhlIGVudGlyZSBzeXN0
ZW0gDQooYW5kIG5vdCBqdXN0IERvbTApLCBhbmQgaWYgdGhlIERvbTAgY2FuIHVzZSB0aGUg
UE1VIGNvbnNpc3RlbnRseS4gVGhlIA0KaWRlYSBoZXJlIGlzIHRvIGhhdmUgYSBtb2RlIHdo
ZXJlIHRoZSBQTVUgcmVnaXN0ZXJzIGFyZSAiZ2xvYmFsIiANCihzeXN0ZW0td2lkZSkgYW5k
IHJlcXVpcmVzIHBpbm5lZCBEb20wIHZDUFVzLg0KDQpJbiB0aGUgY3VycmVudCBkZXNpZ24s
IHRoZSBQTVUgcmVnaXN0ZXJzIGFyZSBzdGFzaGVkaW4gdGhlIHBtdSBwYWdlLCBhbmQgDQpz
eW5jZWQgb24gUE1JLiBUaGUgaXNzdWUgaXMgdGhhdCB0aGUgZm9yIHNldmVyYWwgIG9mIHRo
ZXNlIHJlZ2lzdGVycywgDQp0aGVpciBjb3VudCBpcyB1YXJjaC1kZXBlbmRhbnQgKGFuZCBl
dmVuIFNLVSBkZXBlbmRlbnQpLCB3aGljaCBtYWtlcyB0aGUgDQpsYXlvdXQgb2YgdGhlIHNo
YXJlZCBwYWdlIGNvbXBsZXguDQpBIHByb3Bvc2VkIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRv
IG5vdCBoYXZlIFBNVSByZWdpc3RlcnMgaW4gdGhlIHBhZ2UgDQphbmQgcmVseSBvbiBlaXRo
ZXIgYSBuZXcgZGVkaWNhdGVkIGh5cGVyY2FsbCAoUFYvUFZIIERvbTApIG9yIGRpcmVjdGx5
IA0KdXNlIFJETVNSL1dSTVNSIChQVkggRG9tMCkgdG8gaW50ZXJhY3Qgd2l0aCB0aGVtIGlu
c3RlYWQuDQoNCldpdGggdGhhdCBuZXcgbGF5b3V0LCB0aGUgaHlwZXJ2aXNvciBzdGFja3Ry
YWNlIGNhbiBiZSBwbGFjZWQgcmlnaHQgDQpiZWxvdyB0aGUgb3RoZXIgZmllbGRzIG9mIHRo
ZSBzaGFyZWQgUE1VIHBhZ2UsIGluc3RlYWQgb2YgYXQgdGhlIGJvdHRvbSANCm9mIHRoZSBw
YWdlLCB3aGljaCBtYWtlcyB0aGluZ3MgbXVjaCBzaW1wbGVyLg0KDQpBbm90aGVyIGlkZWEg
SSBoYWQgd291bGQgYmUgdG8gZXhwb3NlIHJkcG1jIHRvIFBWIERvbTAgKENSNC5QQ0UpLCBi
dXQgDQpJJ20gbm90IHN1cmUgaG93IHVzZWZ1bCBpdCdzIGdvaW5nIHRvIGJlIGluIHByYWN0
aWNlLg0KDQpJbiB0aGlzIG5ldyBkZXNpZ24sIGF0IGxlYXN0IGluIHRoZSBjdXJyZW50IHBy
b3Bvc2FsLCBlaXRoZXIgb25seSBQVi9QVkggDQpEb20wIGhhcyBhY2Nlc3MgdG8gdlBNVSwg
b3Igc2VsZWN0IFBWSC9IVk0gaGF2ZSBhY2Nlc3MgdG8gdGhlaXIgb3duIA0KdlBNVS4gVGhl
cmUgaXMgbm8gbG9uZ2VyIHN1cHBvcnQgZm9yIHZQTVUgZm9yIFBWIERvbVUgYW55bW9yZS4N
Cg0KVGVkZHkNCg0KWzFdIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsL2Nv
dmVyLjE3NTMzNzI5MjguZ2l0LmVkd2luLnRvcm9rQGNsb3VkLmNvbS9ULyNtOTUwN2FkODg0
MDUxNTUwM2Y3MzY4MjNkMGQ2OTlmYjFiOGZmYTdhMQ0KDQotLS0NCg0KIyBQcm9wb3NhbCAo
4oCcdlBNVSB2MuKAnSkNCg0KVGhlcmUgYXJlIHJvdWdobHkgMiAoZXhjbHVzaXZlKSBtb2Rl
cyBmb3IgdlBNVSA6DQoNCi0gUHJvZmlsZSB0aGUgc3lzdGVtIGFzIGEgd2hvbGUsIGRyaXZl
biBieSBEb20wDQotIFZpcnR1YWxpemUgUE1VIGluIEhWTSBndWVzdHMgKG5vbi1zZWN1cml0
eSBzdXBwb3J0ZWQpDQogICAtIFVzZSBoYXJkd2FyZSBmYWNpbGl0aWVzIChBTUQgUE1DIFZp
cnR1YWxpemF0aW9uIC8gSW50ZWwgImxvYWQgDQpgSUEzMl9QRVJGX0dMT0JBTF9DVFJMYCIg
Vk1YIGNvbnRyb2wpDQoNClRoZXNlIDIgdXNlLWNhc2VzIGFyZSBleGNsdXNpdmUgYW5kIG5l
ZWRzIHRvIGJlIGNob3NlbiBhdCBib290IHRpbWUgaS5lIDoNCg0KLSBgdnBtdT1vZmZgIC8g
YG5vLXZwbXVgIDogdlBNVSBkaXNhYmxlZCAoZGVmYXVsdCkNCi0gYHZwbXU9Z2xvYmFsYCA6
IE5hdGl2ZSBQTVUgZHJpdmVuIGJ5IERvbTAsIHJlcXVpcmVzIGBkb20wX3ZjcHVzX3BpbmAN
CiAgIC0g4oaSIGxldCBEb20wIHByb2ZpbGUgdGhlIHN5c3RlbQ0KICAgLSBlZmZlY3RpdmVs
eSBzaW1pbGFyIHRvIGBYRU5QTVVfTU9ERV9BTExgDQotIGB2cG11PWh2bWAgOiBQb3NzaWJp
bGl0eSB0byB2aXJ0dWFsaXplIHZQTVUgcGVyIFBWSC9IVk0gZ3Vlc3QgKHdpdGggDQpgWEVO
X0RPTUNUTF9DREZfdnBtdWApDQogICAtIOKGkiBtYWtlIHByb2ZpbGVycyB3b3JrIGluIGd1
ZXN0cw0KDQojIyBHbG9iYWwgUE1VIGZvciBEb20wICh2cG11PWdsb2JhbCkNCg0KR3Vlc3Qg
KERvbTApIG9ic2VydmUgdGhpcyBjYXBhYmlsaXR5IHRocm91Z2ggKHRvIGJlIGludHJvZHVj
ZWQpIA0KYFhFTkZFQVRfdnBtdWAuDQoNCkFkZGl0aW9uYWwgaW5mb3JtYXRpb24gKHN0YWNr
dHJhY2UsIGRvbWlkLCBndWVzdCByZWdpc3RlcnMsIC4uLikgY291bGQgDQpiZSBleHBvc2Vk
IHRocm91Z2ggYSBvcHRpb25hbCAoc2ltcGxpZmllZCkgc2hhcmVkIHBhZ2UgcGVyIENQVS4N
Cg0KIyMjIFBWDQoNClBWIGRvbWFpbnMgd2lsbCBpbnRlcmFjdCAoZS5nIHdyaXRlKSB0byBQ
TVUgcmVnaXN0ZXJzIHRocm91Z2ggYSBuZXcgDQpkZWRpY2F0ZWQgaHlwZXJjYWxsIChgWEVO
UE1VX3tyZWFkLHdyaXRlfV9yZWdzYCkuDQpUaGVzZSBQViBkb21haW5zIHdpbGwgZ2V0IGBD
UjRbUENFXT0xYCAoYXQgbGVhc3QsIGZvciAia2VybmVsLW1vZGUiIGFuZCANCmFyZSBleHBl
Y3RlZCB0byByZWFkIHBlcmZvcm1hbmNlIGNvdW50ZXJzIHRocm91Z2ggYFJEUE1DYCBpbnN0
cnVjdGlvbiANCih3aGljaCBpcyBtb3JlIGVmZmljaWVudCB0aGFuIHRocm91Z2ggaHlwZXJj
YWxscykuDQoNClBNSSBhcmUgZm9yd2FyZGVkIHRocm91Z2ggYFZJUlFfWEVOUE1VYC4NCg0K
IyMjIFBWSA0KDQpQVkggRG9tMCB3aWxsIG9ic2VydmUgImFsbCIgUE1VIHJlZ2lzdGVycyBu
b24taW50ZXJjZXB0ZWQgYW5kIGlzIGFibGUgdG8gDQpjb250cm9sIGl0IHRocm91Z2ggdXN1
YWwgbWVhbnMgKGB3cm1zci9yZG1zci9yZHBtY2ApLCBhbG9uZyB3aXRoIA0KYFhFTlBNVV97
cmVhZCx3cml0ZX1fcmVnc2AuDQoNClhlbiB3aWxsIGVuc3VyZSB0aGF0IHRoZSBQTUkgaXMg
Zm9yd2FyZGVkIHRocm91Z2ggdGhlIGFyY2hpdGVjdHVyYWwgd2F5IA0KKGFuZCBhbHNvIHdp
dGggYFZJUlFfWEVOUE1VYCA/KS4NCg0KIyMgUE1VIGZvciBIVk0gZ3Vlc3RzICh2cG11PWh2
bSkNCg0KVE9ETw0KDQojIyBOb3Rlcw0KDQpJbnRlbCBQRUJTL0RTX0FSRUEvQlRTIGlzIG91
dCBvZiBzY29wZSBhbmQgd2lsbCBub3QgYmUgZXhwb3NlZCBhdCBsZWFzdCANCmZvciBnbG9i
YWwgUE1VIGZvciB0aGUgdGltZSBiZWluZy4NCg==

--------------EDqgBOM9ETMq8NSGw8NY1l2o--

--------------Ima0ajx30A7vZprovN80ysg0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmriLi8FAwAAAAAACgkQZg+p0QLLz9Bb
Fgv9H9/fpMOwND+alLLvXpnhMuts+scBAlj9ce4nXqHL7InwCgOJ8plR60unTIhjMvHPIOJRknG2
e+CpEP+tNwAiN/F+VYzsyk0V8EoHf0GYCPmWJaGrJRxGNGUPF7XHkdb12T7YDgsyhqQevCa1oQo1
qn6R4WzI2fKSFAmz+Jeb/BKbqJQz4fB0CuMYAsni1u9bzU0U8CKWXHBJEnmL5gKlIb4Y4yvXRdRg
Bfe/SpcUy75c5GskekgzvIWZL4gKhPEkk/7kjZXHzfepl+IArw8ETTbT5KTm6GJ1xBPMQP3XaGZM
dmqFW7iHV+Csl2bz8ORTbINz3Uc9Gf3AWfJyIo4UnA0fOSpfDQyDUOwfSCgabhQyjikW1KxSH5dp
IZsnkJdWQevKIefUWV0T2UW92GV6srrjB2lSJUvs8jWfVDquoq/EJPqjRzhv8UglZdOv/MJJZ9SG
StDAtbBp5vy6/pKJkomU+5vwzd/KlX1kUtm8pBIztiCWi/h1I1FlRx9b4VYt
=9ODy
-----END PGP SIGNATURE-----

--------------Ima0ajx30A7vZprovN80ysg0--


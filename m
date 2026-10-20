Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C3B606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 10:55:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1455123.1668844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ7VD-0000f2-GT; Tue, 20 Oct 2026 10:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455123.1668844; Tue, 20 Oct 2026 10:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ7VD-0000ev-Dr; Tue, 20 Oct 2026 10:55:31 +0000
Received: by outflank-mailman (input) for mailman id 1455123;
 Tue, 20 Oct 2026 07:25:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jed@cyberperseus.com>) id 1xJ4Dq-00019w-G7
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 07:25:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ4Dp-005dCq-Py
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:25:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jed@cyberperseus.com>)
 id 6ad71744-8faa-0a2a0a5109dd-0a2a450ce7d2-36
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 09:25:17 +0200
Received: from [139.150.92.17] (helo=smtp92-17.hiworks.co.kr)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jed@cyberperseus.com>)
 id 6ad7175a-f479-0a2a450c0019-8b965c118726-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 09:25:17 +0200
Received: from hi-smtp-node1 (unknown [172.18.0.2])
 by smtp92-17.hiworks.co.kr (Postfix) with ESMTPS id 4j83pf1kcGzkVfg9
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 16:25:14 +0900 (KST)
Received: from hi-smtp-node1 (unknown [192.168.71.54])
 by hi-smtp-node1 (Postfix) with ESMTP id 4j83pf1SpHzQLZQX
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 16:25:14 +0900 (KST)
Received: from split.smtp.hiworks.com
 (amphora-3294b420-308a-4b9e-8a1d-bf25580dae1f.openstack.gabia.io)
 by hi-smtp-node1 with ESMTP id gq6wn6pwwkt77yb6;
 Tue, 20 Oct 2026 16:25:14 +0900 (KST)
Received: from hiworks-k8s (EHLO mail-api-v2-prod-574865655-dnh9d)
 (10.251.81.192) by 0 (smtp-channel-split) with SMTP;
 Tue, 20 Oct 2026 16:25:13 +0900
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Tue, 20 Oct 2026 16:25:13 +0900 (KST)
From: =?UTF-8?B?7KCV7ISd7Jqp?= <jed@cyberperseus.com>
Reply-To: =?UTF-8?B?7KCV7ISd7Jqp?= <jed@cyberperseus.com>
To: xen-devel@lists.xenproject.org
Message-ID: <gab279844341.0.1792481113640@cyberperseus.com>
Subject: [RFC PATCH] xen/device-tree: Experimental support for TI K3 custom
 interrupt properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_108571_1738017415.1792481113640"
X-Priority: 3
X-Authinfo: HIWORKS WEB authenticated <jed@cyberperseus.com|222.106.253.242>
X-purgate-ID: tlsNG-d25034/1792481117-51737A5B-CBB93FB4/0/0
X-purgate-type: clean
X-purgate-size: 6102
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

------=_Part_108571_1738017415.1792481113640
Content-Type: multipart/related; 
	boundary="----=_Part_108572_802335075.1792481113640"

------=_Part_108572_802335075.1792481113640
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpUaGlzIFJGQyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIFRleGFzIEluc3RydW1lbnRz
IChUSSkgSzMgY3VzdG9tIAppbnRlcnJ1cHQgcHJvcGVydGllcyAoJ3RpLGludGVycnVwdC1yYW5n
ZXMnIGFuZCAndGksaW50ci10cmlnZ2VyLXR5cGUnKSAKaW4gWGVuJ3MgZGV2aWNlIHRyZWUgcGFy
c2VyLgoKT24gVEkgSzMgcGxhdGZvcm1zLCBjZXJ0YWluIGRldmljZXMgdXNlIHRoZXNlIGN1c3Rv
bSBwcm9wZXJ0aWVzIGluc3RlYWQgCm9mIHRoZSBzdGFuZGFyZCAnaW50ZXJydXB0cycgcHJvcGVy
dHkgZHVlIHRvIHRoZSBUSS1TQ0kgaW50ZXJydXB0IHJvdXRlciAKYXJjaGl0ZWN0dXJlLiBDdXJy
ZW50bHksIFhlbiBmYWlscyB0byBwYXJzZSB0aGVzZSBub2RlcywgcHJldmVudGluZyAKcHJvcGVy
IGludGVycnVwdCBjb25maWd1cmF0aW9uIGZvciB0aG9zZSBkZXZpY2VzLgoKVG8gYWRkcmVzcyB0
aGlzLCB0aGUgYXR0YWNoZWQgZXhwZXJpbWVudGFsIHBhdGNoIGV4dGVuZHMgCmR0X251bWJlcl9v
Zl9pcnEoKSBhbmQgZHRfZGV2aWNlX2dldF9yYXdfaXJxKCkgdG8gcGFyc2UgCid0aSxpbnRlcnJ1
cHQtcmFuZ2VzJyBhbmQgY2FsY3VsYXRlIHJhdyBJUlFzIGFjY29yZGluZ2x5LgoKSG93ZXZlciwg
dGhpcyBpbXBsZW1lbnRhdGlvbiBoYXMgc2V2ZXJhbCBsaW1pdGF0aW9ucyBhbmQgaXMgZmFyIGZy
b20gaWRlYWw6CjEuIFZlbmRvci1zcGVjaWZpYyBwcm9wZXJ0aWVzIGFyZSBoYXJkY29kZWQgaW50
byBYZW4ncyBjb21tb24gCiAgIGRldmljZSB0cmVlIHBhcnNlci4KMi4gTWFudWFsIGluZGV4IGNh
bGN1bGF0aW9ucyBhbmQgbWFnaWMgbnVtYmVycyBhcmUgdXNlZCByYXRoZXIgdGhhbiAKICAgbGV2
ZXJhZ2luZyBhIHByb3BlciBhYnN0cmFjdGlvbiBsYXllci4KCldlIHdvdWxkIGdyZWF0bHkgYXBw
cmVjaWF0ZSBjb21tdW5pdHkgZmVlZGJhY2sgb24gdGhlIGZvbGxvd2luZyBwb2ludHM6Ci0gSXMg
dGhlcmUgYSBwcmVmZXJyZWQgd2F5IHRvIGhhbmRsZSB2ZW5kb3Itc3BlY2lmaWMgaW50ZXJydXB0
IAogIGJpbmRpbmdzIGxpa2UgdGhpcyB3aXRoaW4gWGVuJ3MgRFQgZnJhbWV3b3JrPwotIFdvdWxk
IGl0IGJlIGJldHRlciB0byByZWZhY3RvciB0aGlzIGxvZ2ljIGludG8gYSBzZXBhcmF0ZSAKICBh
cmNoaXRlY3R1cmUtc3BlY2lmaWMgb3IgY29udHJvbGxlci1zcGVjaWZpYyBsYXllciwgb3IgaXMg
dGhlcmUgCiAgYW4gZXhpc3RpbmcgbWVjaGFuaXNtIHdlIG1pc3NlZD8KCkFueSBhZHZpY2UsIHN1
Z2dlc3Rpb25zLCBvciBhcmNoaXRlY3R1cmFsIGd1aWRhbmNlIGlzIHdlbGNvbWUuCgpCZXN0IHJl
Z2FyZHMsCkplZAoKLS0tCiB4ZW4vY29tbW9uL2RldmljZS10cmVlL2RldmljZS10cmVlLmMgfCA2
NCArKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNjAgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RldmljZS10
cmVlL2RldmljZS10cmVlLmMgYi94ZW4vY29tbW9uL2RldmljZS10cmVlL2RldmljZS10cmVlLmMK
aW5kZXggMGI1Mzc1ZjE1MS4uYTA4NGYwMzQ4NyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9kZXZp
Y2UtdHJlZS9kZXZpY2UtdHJlZS5jCisrKyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZGV2aWNl
LXRyZWUuYwpAQCAtMTEyMyw4ICsxMTIzLDIzIEBAIHVuc2lnbmVkIGludCBkdF9udW1iZXJfb2Zf
aXJxKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2aWNlKQogCiAgICAgLyogR2V0IHRo
ZSBpbnRlcnJ1cHRzIHByb3BlcnR5ICovCiAgICAgaW50c3BlYyA9IGR0X2dldF9wcm9wZXJ0eShk
ZXZpY2UsICJpbnRlcnJ1cHRzIiwgJmludGxlbik7Ci0gICAgaWYgKCBpbnRzcGVjID09IE5VTEwg
KQotICAgICAgICByZXR1cm4gMDsKKyAgICBpZiAoIGludHNwZWMgPT0gTlVMTCApIHsKKyAgICAg
ICAgaW50IGksIHJldGludG51bSA9IDA7CisgICAgICAgIGludHNwZWMgPSBkdF9nZXRfcHJvcGVy
dHkoZGV2aWNlLCAidGksaW50ZXJydXB0LXJhbmdlcyIsICZpbnRsZW4pOworICAgICAgICBpZihp
bnRzcGVjID09IE5VTEwpIHsKKyAgICAgICAgICAgIHJldHVybiAwOworICAgICAgICB9CisgICAg
ICAgIGludGxlbiAvPSBzaXplb2YoKmludHNwZWMpOworICAgICAgICBkdF9kcHJpbnRrKCIgdXNp
bmcgJ3RpLGludGVycnVwdC1yYW5nZXMnIHByb3BlcnR5XG4iKTsKKworICAgICAgICBmb3IoIGkg
PSAyIDsgaSA8IGludGxlbjsgaSs9Myl7CisgICAgICAgICAgICByZXRpbnRudW0gKz0gYmUzMl90
b19jcHUoaW50c3BlY1tpXSk7CisgICAgICAgIH0KKyAgICAgICAgZHRfZHByaW50aygiIGludHNw
ZWM9JWQgaW50bGVuPSVkXG4iLCBiZTMyX3RvX2NwdSgqaW50c3BlYyksIHJldGludG51bSk7CisK
KyAgICAgICAgcmV0dXJuIHJldGludG51bTsKKyAgICB9CisKICAgICBpbnRsZW4gLz0gc2l6ZW9m
KCppbnRzcGVjKTsKIAogICAgIGR0X2RwcmludGsoIiB1c2luZyAnaW50ZXJydXB0cycgcHJvcGVy
dHlcbiIpOwpAQCAtMTU3OCw4ICsxNTkzLDQ5IEBAIGludCBkdF9kZXZpY2VfZ2V0X3Jhd19pcnEo
Y29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXZpY2UsCiAKICAgICAvKiBHZXQgdGhlIGlu
dGVycnVwdHMgcHJvcGVydHkgKi8KICAgICBpbnRzcGVjID0gZHRfZ2V0X3Byb3BlcnR5KGRldmlj
ZSwgImludGVycnVwdHMiLCAmaW50bGVuKTsKLSAgICBpZiAoIGludHNwZWMgPT0gTlVMTCApCi0g
ICAgICAgIHJldHVybiAtRUlOVkFMOworICAgIGlmICggaW50c3BlYyA9PSBOVUxMICl7CisgICAg
ICAgIGludCBpID0gMCwgbmV3aWR4ID0gMCwgY3VybWF4ID0gMCwgdHJpZ2dlcnR5cGUgPSA0Owor
ICAgICAgICB1MzIgdHlwZWxlbjsKKworICAgICAgICBpbnRzcGVjID0gZHRfZ2V0X3Byb3BlcnR5
KGRldmljZSwgInRpLGludGVycnVwdC1yYW5nZXMiLCAmaW50bGVuKTsKKyAgICAgICAgaWYoaW50
c3BlYyA9PSBOVUxMKSB7CisgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICAgICAgfQor
ICAgICAgICBpbnRsZW4gLz0gc2l6ZW9mKCppbnRzcGVjKTsKKyAgICAgICAgZHRfZHByaW50aygi
IHVzaW5nICd0aSxpbnRlcnJ1cHQtcmFuZ2VzJyBwcm9wZXJ0eVxuIik7CisgICAgICAgIGR0X2Rw
cmludGsoIiBpbnRzcGVjPSVkIGludGxlbj0lZFxuIiwgYmUzMl90b19jcHUoKmludHNwZWMpLCBp
bnRsZW4pOworCisgICAgICAgIHAgPSBkdF9pcnFfZmluZF9wYXJlbnQoZGV2aWNlKTsKKyAgICAg
ICAgaWYgKCBwID09IE5VTEwgKQorICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisKKyAgICAg
ICAgaSA9IDA7CisgICAgICAgIG5ld2lkeCA9IGluZGV4OworICAgICAgICBjdXJtYXggPSBiZTMy
X3RvX2NwdShpbnRzcGVjW2kgKyAyXSk7CisgICAgICAgIHdoaWxlKG5ld2lkeCA+PSBjdXJtYXgp
eworICAgICAgICAgICAgbmV3aWR4IC09IGN1cm1heDsKKworICAgICAgICAgICAgaSArPSAzOwor
ICAgICAgICAgICAgY3VybWF4ID0gYmUzMl90b19jcHUoaW50c3BlY1tpICsgMl0pOworICAgICAg
ICB9CisKKyAgICAgICAgdG1wID0gZHRfZ2V0X3Byb3BlcnR5KGRldmljZSwgInRpLGludHItdHJp
Z2dlci10eXBlIiwgJnR5cGVsZW4pOworICAgICAgICBpZih0bXAgIT0gTlVMTCkgeworICAgICAg
ICAgICAgZHRfZHByaW50aygiIHVzaW5nICd0aSxpbnRyLXRyaWdnZXItdHlwZScgcHJvcGVydHlc
biIpOworICAgICAgICAgICAgZHRfZHByaW50aygiIHRtcD0lZCB0eXBlbGVuPSVkXG4iLCBiZTMy
X3RvX2NwdSgqdG1wKSwgdHlwZWxlbik7CisKKyAgICAgICAgICAgIHRyaWdnZXJ0eXBlID0gYmUz
Ml90b19jcHUoKnRtcCk7CisgICAgICAgIH0KKworICAgICAgICBvdXRfaXJxLT5zcGVjaWZpZXJb
MF0gPSAwOworICAgICAgICBvdXRfaXJxLT5zcGVjaWZpZXJbMV0gPSBiZTMyX3RvX2NwdShpbnRz
cGVjW2kgKyAxXSkgKyBuZXdpZHggLSAzMjsKKyAgICAgICAgb3V0X2lycS0+c3BlY2lmaWVyWzJd
ID0gdHJpZ2dlcnR5cGU7CisgICAgICAgIG91dF9pcnEtPnNpemUgPSAzOworICAgICAgICBvdXRf
aXJxLT5jb250cm9sbGVyID0gcDsKKworICAgICAgICByZXR1cm4gMDsKKyAgICB9CisKICAgICBp
bnRsZW4gLz0gc2l6ZW9mKCppbnRzcGVjKTsKIAogICAgIGR0X2RwcmludGsoIiB1c2luZyAnaW50
ZXJydXB0cycgcHJvcGVydHlcbiIpOwotLSAKMi40My4wCg==
------=_Part_108572_802335075.1792481113640--

------=_Part_108571_1738017415.1792481113640--


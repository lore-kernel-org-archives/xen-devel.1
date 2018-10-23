From: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>
Subject: Re: [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
Date: Tue, 23 Oct 2018 20:40:29 +0200
Message-ID: <5d467c35-a524-ab84-e2fd-e0e80211ae7d@alstadheim.priv.no>
References: <8a3bc517-1255-4547-d244-5c400e44cc77@Oracle.COM>
 <f19dbb09-ef22-2cf4-fb38-2a7c42b5dc48@Oracle.COM>
 <5A377E020200007800197FFA@prv-mh.provo.novell.com>
 <559ffd12-b541-8a69-60bd-fbe10e3dc159@oracle.com>
 <20180916114306.GF18222@reaktio.net>
 <a726840b-8a5c-0890-73c6-3a95a7205153@oracle.com>
 <20180918071519.GG18222@reaktio.net>
 <5E7DDB68-4E68-48A5-AEEC-EE1B21A50E9E@citrix.com>
 <352310b3-ec9b-2ceb-83f0-4550718120c3@oracle.com>
 <20180919090526.s3ahnemrt2ik2tx3@mac.bytemobile.com>
 <20181003155104.GH5318@reaktio.net>
 <f6b8e055-7afc-b4de-af88-425d799dcd28@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hwk7=nd=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
 id 1gF1bY-0000V8-6m
 for xen-devel@lists.xenproject.org; Tue, 23 Oct 2018 18:40:36 +0000
Received: from postfix-relay.alstadheim.priv.no
 (148-252-110.181.3p.ntebredband.no [148.252.110.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: hakon.alstadheim@ntebb.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 8D212800BF
 for <xen-devel@lists.xenproject.org>; Tue, 23 Oct 2018 20:40:30 +0200 (CEST)
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
 by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id 101C2624E86D
 for <xen-devel@lists.xenproject.org>; Tue, 23 Oct 2018 20:40:29 +0200 (CEST)
Received: from [192.168.2.201] (unknown [192.168.2.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hakon)
 by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id B1549241066E
 for <xen-devel@lists.xenproject.org>; Tue, 23 Oct 2018 20:40:29 +0200 (CEST)
In-Reply-To: <f6b8e055-7afc-b4de-af88-425d799dcd28@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpEZW4gMDguIG9rdC4gMjAxOCAxNjozMiwgc2tyZXYgQm9yaXMgT3N0cm92c2t5Ogo+Cj4gQXJl
IHRoZXNlIHR3byBwYXRjaGVzIHN0aWxsIG5lZWRlZD8gSVNUUiB0aGV5IHdlcmXCoCB3cml0dGVu
IG9yaWdpbmFsbHkKPiB0byBkZWFsIHdpdGggZ3Vlc3QgdHJ5aW5nIHRvIHVzZSBkZXZpY2UgdGhh
dCB3YXMgcHJldmlvdXNseSBhc3NpZ25lZCB0bwo+IGFub3RoZXIgZ3Vlc3QuIEJ1dCBwY2lzdHVi
X3B1dF9wY2lfZGV2KCkgY2FsbHMKPiBfX3BjaV9yZXNldF9mdW5jdGlvbl9sb2NrZWQoKSB3aGlj
aCBmaXJzdCB0cmllcyBGTFIsIGFuZCBpdCBsb29rcyBsaWtlCj4gaXQgd2FzIGFkZGVkIHJlbGF0
aXZlbHkgcmVjZW50bHkuCj4KPgpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksIGJ1dCBJIGp1c3Qg
bm93IGJvb3RlZCB4ZW4gc3RhZ2luZy00LjExCig5NGZiYTlmNDM4YTJjMzZhZDliZjNhNDgxYTYw
MTNkZGM3Y2Y4Y2Q5KSwgd2l0aCBnZW50b28tc291cmNlcy00LjE5LjAKYXMgZG9tMC4gU2h1dCBk
b3duIGFuZCBzdGFydGVkIGFnYWluIGEgVk0gdGhhdCBoYXMgYSBzZWNvbmRhcnkgR1BVCnBhc3Nl
ZCB0aHJvdWdoLCBhbmQgdGhlIHdob2xlwqAgbWFjaGluZSBodW5nLiBJIGhhdmVuJ3QgaGFkIHRp
bWUgdG8gbG9vawptb3JlIGNsb3NlbHkgaW50byB0aGlzLCBvdGhlciB0aGFuIHRoYXQgbXkgb2xk
ICJkb19mbHIiIHBhdGNoIG5vIGxvbmdlcgphcHBsaWVzIHRvIGdlbnRvby1zb3VyY2VzIChpLmUu
IHRoZSBsaW51eCBrZXJuZWwgc291cmNlcykgLiAiZG9fZmxyIgp3b3JrZWQgZm9yIG1lIG9uIGxp
bnV4LTQuMTguPyAsIHdpdGggYXBwcm9wcmlhdGUgcGF0Y2ggdG8gdGhlIGxpbnV4IGtlcm5lbC4K
ClNvLCBzb21ldGhpbmcgaXMgZGVmaW5pdGVseSBuZWVkZWQuIE5vICJyZXNldCIgLCBvciAiZG9f
ZmxyIiBpcyBwcmVzZW50CmluIGxpbnV4LTQuMTkuMCwgdml6Ogo8Y29kZT4KJCBjZCAvdXNyL3Ny
Yy9saW51eC9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjawokIGdyZXAgRFJJVkVSICoKcGNpX3N0dWIu
YzojZGVmaW5lIFBDSVNUVUJfRFJJVkVSX05BTUUgInBjaWJhY2siCnBjaV9zdHViLmM6wqDCoMKg
wqDCoMKgwqDCoMKgICFzdHJjbXAoZGV2LT5kcml2ZXJfb3ZlcnJpZGUsIFBDSVNUVUJfRFJJVkVS
X05BTUUpKSB8fApwY2lfc3R1Yi5jOsKgwqDCoMKgIC5uYW1lID0gUENJU1RVQl9EUklWRVJfTkFN
RSwKcGNpX3N0dWIuYzpzdGF0aWMgRFJJVkVSX0FUVFJfV08obmV3X3Nsb3QpOwpwY2lfc3R1Yi5j
OnN0YXRpYyBEUklWRVJfQVRUUl9XTyhyZW1vdmVfc2xvdCk7CnBjaV9zdHViLmM6c3RhdGljIERS
SVZFUl9BVFRSX1JPKHNsb3RzKTsKcGNpX3N0dWIuYzpzdGF0aWMgRFJJVkVSX0FUVFJfUk8oaXJx
X2hhbmRsZXJzKTsKcGNpX3N0dWIuYzpzdGF0aWMgRFJJVkVSX0FUVFJfV08oaXJxX2hhbmRsZXJf
c3RhdGUpOwpwY2lfc3R1Yi5jOnN0YXRpYyBEUklWRVJfQVRUUl9SVyhxdWlya3MpOwpwY2lfc3R1
Yi5jOnN0YXRpYyBEUklWRVJfQVRUUl9SVyhwZXJtaXNzaXZlKTsKcGNpX3N0dWIuYzrCoMKgwqDC
oCBpZiAoYWN0aW9uICE9IEJVU19OT1RJRllfVU5CSU5EX0RSSVZFUikKJAo8L2NvZGU+CgpJJ2Qg
YmUgaGFwcHkgdG8gdGVzdCBwYXRjaGVzLiBTZWVtcyBJIG9ubHkgZ290IG9uZSBjb3JydXB0IGZp
bGUgZnJvbSBteQp0ZXN0IHRoaXMgbW9ybmluZyA6LUQgLgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

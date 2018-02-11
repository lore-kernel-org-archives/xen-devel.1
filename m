From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/2] xen: xenbus: WARN_ON
 XS_TRANSACTION_{START, END} misuse
Date: Sun, 11 Feb 2018 10:28:38 -0500
Message-ID: <0bf1782a-b7c4-1775-c2cb-6e68fe62a199__22663.3606864654$1518362908$gmane$org@oracle.com>
References: <20180207222236.7434-1-simon@invisiblethingslab.com>
 <20180207222236.7434-2-simon@invisiblethingslab.com>
 <8a0fd059-7acf-3279-10f9-649c19522e2a@oracle.com>
 <66103cca-321e-6950-2083-6f5d068e12e6@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=unse=ff=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ektYg-0005Bg-ID
 for xen-devel@lists.xenproject.org; Sun, 11 Feb 2018 15:28:50 +0000
In-Reply-To: <66103cca-321e-6950-2083-6f5d068e12e6@invisiblethingslab.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8xMC8yMDE4IDA4OjI3IFBNLCBTaW1vbiBHYWlzZXIgd3JvdGU6Cj4gQm9yaXMgT3N0
cm92c2t5Ogo+PiBPbiAwMi8wNy8yMDE4IDA1OjIyIFBNLCBTaW1vbiBHYWlzZXIgd3JvdGU6Cj4+
PiArICAgIHVzZXJzX29sZCA9IHhzX3N0YXRlX3VzZXJzOwo+Pj4gICAgICAgIHhzX3N0YXRlX3Vz
ZXJzLS07Cj4+PiAgICAgICAgaWYgKChyZXEtPnR5cGUgPT0gWFNfVFJBTlNBQ1RJT05fU1RBUlQg
JiYgcmVxLT5tc2cudHlwZSA9PSBYU19FUlJPUikgfHwKPj4+ICAgICAgICAgICAgcmVxLT50eXBl
ID09IFhTX1RSQU5TQUNUSU9OX0VORCkKPj4+ICAgICAgICAgICAgeHNfc3RhdGVfdXNlcnMtLTsK
Pj4+ICsgICAgaWYgKFdBUk5fT04oeHNfc3RhdGVfdXNlcnMgPiB1c2Vyc19vbGQpKQo+Pgo+Pgo+
PiBXQVJOX09OX09OQ0UoKT8KPiAKPiBTaW5jZSB3ZSAiZml4IiB0aGUgd3JvbmcgZGVjcmVtZW50
IGJ5IGNsYW1waW5nIGF0IHplcm8gaXQgc2hvdWxkIG5vdAo+IGhhcHBlbiBpbW1lZGlhdGVseSBh
Z2Fpbi4gQnV0IGlmIHlvdSBwcmVmZXIgX09OQ0UgSSBjYW4gY2hhbmdlIGl0Lgo+IAoKCklmIHRo
aXMgZXJyb3IgY2FuIGhhcHBlbiBvbmNlIHRoZW4gc29tZW9uZSBhdCBsZWFzdCB0aGVvcmV0aWNh
bGx5IGNhbiAKY29uc3RydWN0IGEgY2FzZSB3aGVuIGl0IGlzIHJlcGVhdGVkLiBTbyBsZXQncyBz
d2l0Y2ggdG8gX09OQ0UoKSB2YXJpYW50LgoKVGhhbmtzLgotYm9yaXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: Fix two possible
 sleep-in-atomic-context bugs in create_active()
Date: Wed, 20 Jun 2018 08:52:17 +0200
Message-ID: <c2f8d60a-58c5-9555-92f6-2a5ce2bd1e7e@suse.com>
References: <20180620023846.30618-1-baijiaju1990@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0eme=jg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fVWya-00081W-2n
 for xen-devel@lists.xenproject.org; Wed, 20 Jun 2018 06:52:20 +0000
In-Reply-To: <20180620023846.30618-1-baijiaju1990@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jia-Ju Bai <baijiaju1990@gmail.com>, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDYvMTggMDQ6MzgsIEppYS1KdSBCYWkgd3JvdGU6Cj4gVGhlIGRyaXZlciBtYXkgc2xl
ZXAgd2l0aCBob2xkaW5nIGEgc3BpbmxvY2suCj4gVGhlIGZ1bmN0aW9uIGNhbGwgcGF0aHMgKGZy
b20gYm90dG9tIHRvIHRvcCkgaW4gTGludXgtNC4xNi43IGFyZToKPiAKPiBbRlVOQ10gX19nZXRf
ZnJlZV9wYWdlcyhHRlBfS0VSTkVMKQo+IGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYywgMzUx
OiBfX2dldF9mcmVlX3BhZ2VzIGluIGNyZWF0ZV9hY3RpdmUKPiBkcml2ZXJzL3hlbi9wdmNhbGxz
LWZyb250LmMsIDgwMDogY3JlYXRlX2FjdGl2ZSBpbiBwdmNhbGxzX2Zyb250X2FjY2VwdAo+IGRy
aXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYywgNzgzOiBzcGluX2xvY2sgaW4gcHZjYWxsc19mcm9u
dF9hY2NlcHQKPiAKPiBbRlVOQ10gX19nZXRfZnJlZV9wYWdlcyhHRlBfS0VSTkVMKQo+IGRyaXZl
cnMveGVuL3B2Y2FsbHMtZnJvbnQuYywgMzQ3OiBfX2dldF9mcmVlX3BhZ2VzIGluIGNyZWF0ZV9h
Y3RpdmUKPiBkcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMsIDgwMDogY3JlYXRlX2FjdGl2ZSBp
biBwdmNhbGxzX2Zyb250X2FjY2VwdAo+IGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYywgNzgz
OiBzcGluX2xvY2sgaW4gcHZjYWxsc19mcm9udF9hY2NlcHQKPiAKPiBUbyBmaXggdGhlc2UgYnVn
cywgR0ZQX0tFUk5FTCBpcyByZXBsYWNlZCB3aXRoIEdGUF9BVE9NSUMuCj4gCj4gVGhlc2UgYnVn
cyBhcmUgZm91bmQgYnkgbXkgc3RhdGljIGFuYWx5c2lzIHRvb2wgKERTQUMtMikgYW5kIGNoZWNr
ZWQgYnkgbXkKPiBjb2RlIHJldmlldy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaWEtSnUgQmFpIDxi
YWlqaWFqdTE5OTBAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

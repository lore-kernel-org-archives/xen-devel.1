From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] xen: Add acpu_sleep=s3_fake command-line
 option for testing
Date: Tue, 22 May 2018 15:43:07 +0100
Message-ID: <f0879b1f-ad9f-d930-d256-0ec22daf9ed2@citrix.com>
References: <20180522133504.11859-1-george.dunlap@citrix.com>
 <5B041DC202000078001C4B2A@prv1-mh.provo.novell.com>
 <a7b19732-c3a3-c918-2a00-29de0b5b87eb@citrix.com>
 <01515f54-ad31-f7ea-3cf9-d14b9ab0f26a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sjxm=ij=citrix.com=prvs=67362c789=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fL8VN-0002J5-NT
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 14:43:13 +0000
In-Reply-To: <01515f54-ad31-f7ea-3cf9-d14b9ab0f26a@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <JGross@suse.com>, Ian Jackson <ian.jackson@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjIvMjAxOCAwMzozNyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMi8wNS8x
OCAxNDo0OCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMDUvMjIvMjAxOCAwMjo0MCBQTSwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyMi4wNS4xOCBhdCAxNTozNSwgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93
ZXIuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKPj4+PiBAQCAtMzMsNiAr
MzMsOCBAQAo+Pj4+ICAKPj4+PiAgdWludDMyX3Qgc3lzdGVtX3Jlc2V0X2NvdW50ZXIgPSAxOwo+
Pj4+ICAKPj4+PiArc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBvcHRfZmFrZV9zMyA9IGZhbHNl
Owo+Pj4gV2l0aCB0aGUgdHlwbyBpbiB0aGUgdGl0bGUgKHdhbnRzIHRvIGJlIGFjcGlfc2xlZXAp
IGNvcnJlY3RlZCAKPj4gT29wcyAtLSBJIGNhbiBmaXggdGhpcyBvbiBjaGVjay1pbiAob25jZSB0
aGUgZGV2ZWxvcG1lbnQgd2luZG93IG9wZW5zKS4KPiAKPiBJZiB0aGlzIHBhdGNoIGlzIG5lY2Vz
c2FyeSwgb3IgYXQgbGVhc3QgYSB1c2VmdWwgYWlkIHRvIHRyYWNrIGRvd24gYW4gUzMKPiBidWcg
aW4gWGVuIDQuMTEsIEkgdm90ZSBmb3IgaXRzIGluY2x1c2lvbi4KPiAKPiBBcyBmYXIgYXMgdGhl
IGNoYW5nZSBpdHNlbGYgZ29lcywgaXQgaXMgdmVyeSBzaW1wbGUsIHdpdGggYSBtaW5pbWFsCj4g
Y2hhbmdlIG9mIGFueSB1bmludGVuZGVkIHNpZGUgZWZmZWN0cy4KPiAKPiBDQydpbmcgdGhlIFJN
IGZvciBoaXMgZGVjaXNpb24gb24gdGhlIHN1YmplY3QuCgpVc2luZyBgcnRjd2FrZSAtcyAxMCAt
bSBtZW1gLCB0aGUgb25seSBkaWZmZXJlbmNlIEkndmUgc2VlbiBiZXR3ZWVuCnN1c3BlbmQgd2l0
aCB0aGlzIHBhdGNoIGFuZCB3aXRob3V0IGlzIHRoYXQgaXQgZG9lc24ndCBhY3R1YWxseSBzbGVl
cApmb3IgMTAgc2Vjb25kcyAtLSBub3Qgc3VycHJpc2luZywgYXMgaXQgd2FzIG5ldmVyIGFzbGVl
cC4gOi0pCgpJIGFncmVlIHRoYXQgaXQncyBxdWl0ZSBsb3cgcmlzazsgYnV0IGl0IGRvZXNuJ3Qg
c2VlbSB0byBtZSB0byBiZSB2ZXJ5CmNyaXRpY2FsIGVpdGhlciwgd2hpY2ggaXMgd2h5IEkgZGlk
bid0IENDIEp1ZXJnZW4gaW4gdGhlIGZpcnN0IHBsYWNlLgpCdXQgSSdtIGZpbmUgZWl0aGVyIHdh
eS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

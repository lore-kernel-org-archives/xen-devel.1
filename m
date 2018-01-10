From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 04/24] x86: Don't use potentially
 incorrect CPUID values for topology information
Date: Wed, 10 Jan 2018 12:45:30 +0000
Message-ID: <20180110124530.jvpdg6c6wyott3m5@citrix.com>
References: <1515542578-15412-1-git-send-email-aliguori@amzn.com>
 <1515542578-15412-5-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=n68a=ef=citrix.com=prvs=5419c82cb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eZFlC-0002S3-Vt
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 12:45:39 +0000
Content-Disposition: inline
In-Reply-To: <1515542578-15412-5-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMDksIDIwMTggYXQgMDQ6MDI6MzhQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEphbiBILiBTY2jDtm5oZXJyIDxqc2Nob2VuaEBhbWF6b24uZGU+Cj4g
Cj4gSW50ZWwgc2F5cyBmb3IgQ1BVSUQgbGVhZiAwQmg6Cj4gCj4gICAiU29mdHdhcmUgbXVzdCBu
b3QgdXNlIEVCWFsxNTowXSB0byBlbnVtZXJhdGUgcHJvY2Vzc29yCj4gICAgdG9wb2xvZ3kgb2Yg
dGhlIHN5c3RlbS4gVGhpcyB2YWx1ZSBpbiB0aGlzIGZpZWxkCj4gICAgKEVCWFsxNTowXSkgaXMg
b25seSBpbnRlbmRlZCBmb3IgZGlzcGxheS9kaWFnbm9zdGljCj4gICAgcHVycG9zZXMuIFRoZSBh
Y3R1YWwgbnVtYmVyIG9mIGxvZ2ljYWwgcHJvY2Vzc29ycwo+ICAgIGF2YWlsYWJsZSB0byBCSU9T
L09TL0FwcGxpY2F0aW9ucyBtYXkgYmUgZGlmZmVyZW50IGZyb20KPiAgICB0aGUgdmFsdWUgb2Yg
RUJYWzE1OjBdLCBkZXBlbmRpbmcgb24gc29mdHdhcmUgYW5kIHBsYXRmb3JtCj4gICAgaGFyZHdh
cmUgY29uZmlndXJhdGlvbnMuIgo+IAo+IEFuZCB5ZXQsIHdlJ3JlIHVzaW5nIHRoZW0gdG8gZGVy
aXZlIHRoZSBudW1iZXIgY29yZXMgaW4gYSBwYWNrYWdlCj4gYW5kIHRoZSBudW1iZXIgb2Ygc2li
bGluZ3MgaW4gYSBjb3JlLgo+IAo+IERlcml2ZSB0aGUgbnVtYmVyIG9mIHNpYmxpbmdzIGFuZCBj
b3JlcyBmcm9tIEVBWCBpbnN0ZWFkLCB3aGljaCBpcwo+IGludGVuZGVkIGZvciB0aGF0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEphbiBILiBTY2jDtm5oZXJyIDxqc2Nob2VuaEBhbWF6b24uZGU+CgpU
aGlzIGlzIGFscmVhZHkgbWVyZ2VkIHRvIHN0YWdpbmcuCgpXZWkuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

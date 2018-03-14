From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 01/16] x86/mm: skip incrementing mfn if
 it is not a valid mfn
Date: Wed, 14 Mar 2018 18:31:27 +0000
Message-ID: <0c778b64-7eda-48fb-7eaf-8e766dfc334a@citrix.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-2-julien.grall@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com, xen-devel@lists.xen.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMTggMTg6MTksIGp1bGllbi5ncmFsbEBhcm0uY29tIHdyb3RlOgo+IEZyb206IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4KPiBUaGUgZnVuY3Rpb24gaXMgY2FsbGVkIHRv
IGZpbGwgaW4gcGFnZSB0YWJsZSBlbnRyaWVzIGluCj4gcG9wdWxhdGVfcHRfcmFuZ2UuIFNraXAg
aW5jcmVtZW50aW5nIG1mbiBpZiBpdCBpcyBpbnZhbGlkLgo+Cj4gU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJlbWluZCBtZSB3aGF0IHRoZSBwdXJwb3NlIG9m
IHRoaXMgcGF0Y2ggaXM/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

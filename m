From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/5] x86/pv: Avoid leaking other guests'
 MSR_TSC_AUX values into PV context
Date: Tue, 20 Feb 2018 15:49:33 +0000
Message-ID: <20180220154933.svrm6ijb75upoaol@MacBook-Pro-de-Roger.local>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMTE6NTg6NDBBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJZiB0aGUgQ1BVIHBpcGVsaW5lIHN1cHBvcnRzIFJEVFNDUCBvciBSRFBJRCwgYSBn
dWVzdCBjYW4gb2JzZXJ2ZSB0aGUgdmFsdWUgaW4KPiBNU1JfVFNDX0FVWCwgaXJyZXNwZWN0aXZl
IG9mIHdoZXRoZXIgdGhlIHJlbGV2YW50IENQVUlEIGZlYXR1cmVzIGFyZQo+IGFkdmVydGlzZWQv
aGlkZGVuLgo+IAo+IEF0IHRoZSBtb21lbnQsIHBhcmF2aXJ0X2N0eHRfc3dpdGNoX3RvKCkgb25s
eSB3cml0ZXMgdG8gTVNSX1RTQ19BVVggaWYKPiBUU0NfTU9ERV9QVlJEVFNDUCBtb2RlIGlzIGVu
YWJsZWQsIGJ1dCB0aGlzIGlzIG5vdCB0aGUgZGVmYXVsdCBtb2RlLgo+IFRoZXJlZm9yZSwgZGVm
YXVsdCBQViBndWVzdHMgY2FuIHJlYWQgdGhlIHZhbHVlIGZyb20gYSBwcmV2aW91c2x5IHNjaGVk
dWxlZAo+IEhWTSB2Y3B1LCBvciBUU0NfTU9ERV9QVlJEVFNDUC1lbmFibGVkIFBWIGd1ZXN0Lgo+
IAo+IEFsdGVyIHRoZSBQViBwYXRoIHRvIGFsd2F5cyB3cml0ZSB0byBNU1JfVFNDX0FVWCwgdXNp
bmcgMCBpbiB0aGUgY29tbW9uIGNhc2UuCj4gCj4gVG8gYW1vcnRpc2Ugb3ZlcmhlYWQgY29zdCwg
aW50cm9kdWNlIHdybXNyX3RzY19hdXgoKSB3aGljaCBwZXJmb3JtcyBhIGxhenkKPiB1cGRhdGUg
b2YgdGhlIE1TUiwgYW5kIHVzZSB0aGlzIGZ1bmN0aW9uIGNvbnNpc3RlbnRseSBhY3Jvc3MgdGhl
IGNvZGViYXNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

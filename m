From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 5/9] libxl: Do root checks once in
 libxl__domain_get_device_model_uid
Date: Wed, 28 Nov 2018 17:38:58 +0000
Message-ID: <A7BD7C15-A4B7-4652-9AE0-1591F0DCD16E@citrix.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-5-george.dunlap@citrix.com>
 <23550.50346.919097.312284@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/WKf=OH=citrix.com=prvs=86304e188=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gS3nh-0006kD-Qn
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:39:01 +0000
In-Reply-To: <23550.50346.919097.312284@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <C52C30BC8C6F9E41BE45820B5F36978E@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTm92IDI4LCAyMDE4LCBhdCA0OjM5IFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIltQQVRD
SCA1LzldIGxpYnhsOiBEbyByb290IGNoZWNrcyBvbmNlIGluIGxpYnhsX19kb21haW5fZ2V0X2Rl
dmljZV9tb2RlbF91aWQiKToNCj4+IEF0IHRoZSBtb21lbnQsIHdlIGNoZWNrIGZvciBlcXVpdmFs
ZW5jZSB0byBsaXRlcmFsICJyb290IiBiZWZvcmUNCj4+IGRlY2lkaW5nIHdoZXRoZXIgdG8gYWRk
IHRoZSBgcnVuYXNgIGNvbW1hbmQtbGluZSBvcHRpb24gdG8gUUVNVS4gIFRoaXMNCj4+IGlzIHVu
c2F0aXNmYWN0b3J5IGZvciBzZXZlcmFsIHJlYXNvbnMuDQo+IA0KPiBJIHdhcyBpbiB0d28gbWlu
ZHMgYWJvdXQgdGhlIGdvdG9zIGluIHRoZSBlYXJsaWVyIHZlcnNpb24gb2YgdGhpcw0KPiBwYXRj
aC4gIEJ1dCBoZXJlIHRoZXkgYXJlIGdldHRpbmcgcXVpdGUgb3V0IG9mIGhhbmQuDQo+IA0KPiBJ
IGtub3cgdGhhdCBpbiB0aGUgaHlwZXJ2aXNvciB0aGlzIGtpbmQgb2YgdGhpbmcgaXMgdG9sZXJh
dGVkICh3cm9uZ2x5DQo+IElNTykgYnV0IGNhbiB3ZSBwbGVhc2Ugbm90IGhhdmUgaXQgaGVyZS4N
Cg0KSXQgaXMgYSBiaXQgc3RyYW5nZSBoYXZpbmcgdG8gd29yayB3aXRoIG9uZSBtYWludGlhbmVy
IHdobyB0aGlua3MgYSBoYW5kZnVsIG9mIHNpbXBsZSBnb3RvcyBpcyBhbiBpc3N1ZSwgYW5kIGFu
b3RoZXIgbWFpbnRhaW5lciB3aG8gdGhpbmtzIGhhdmluZyBzd2l0Y2ggY2FzZSBzdGF0ZW1lbnRz
IGFwcGVhciBpbiB0aGUgbWlkZGxlIG9mIGlmKCkgeyB9IGJsb2NrcyBpcyBwZXJmZWN0bHkgbm9y
bWFsLiA6LSkNCg0KPiBUaGlzIG1heSBtZWFuIHNwbGl0dGluZyBzdHVmZiBvdXQgaW50byBhIHN1
Yi1mdW5jdGlvbi4gIFRoYXQgY291bGQgYmUNCj4gZG9uZSBzb21lIHRpbWUgYmV0d2VlbiAiTW92
ZSBkbSB1c2VyIGRldGVybWluYXRpb24gbG9naWMgaW50byBhIGhlbHBlcg0KPiBmdW5jdGlvbiIg
YW5kIHRoaXMgcGF0Y2ggSSBndWVzcy4NCg0KSeKAmW0gYWZyYWlkIHlvdeKAmXJlIGdvaW5nIHRv
IGhhdmUgdG8gZ2l2ZSBtZSBhIGJpdCBtb3JlIGd1aWRhbmNlIGhlcmU6IEl04oCZcyBub3QgY2xl
YXIgdG8gbWUgd2hhdCB3b3VsZCBiZSBzcGxpdCBpbnRvIGEgc3ViLWZ1bmN0aW9uLCBhbmQgaG93
IHRoYXQgd291bGQgbWFrZSB0aGUgY29kZSBlYXNpZXIgdG8gZm9sbG93IHdoaWxlIGF2b2lkaW5n
IHVubmVjZXNzYXJ5IGNvZGUgZHVwbGljYXRpb24uDQoNCkRvIHlvdSBwcm9wb3NlIHJlcGxhY2lu
ZyDigJxnb3RvIHJvb3RfY2hlY2s74oCdIHdpdGgg4oCccm9vdF9jaGVjaygpOyBnb3RvIG91dDvi
gJ0gaW4gYWxsIGxvY2F0aW9ucz8gIE9yIHNvbWV0aGluZyBlbHNlPw0KDQogLUdlb3JnZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

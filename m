From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V6] x86/altp2m: Make sure EPTP_INDEX is
 up-to-date when enabling #VE
Date: Thu, 2 Aug 2018 06:34:10 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191291285@SHSMSX101.ccr.corp.intel.com>
References: <1533191138-8551-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wuhy=kr=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fl7Bh-0003Fi-DB
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 06:34:17 +0000
In-Reply-To: <1533191138-8551-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSYXp2YW4gQ29qb2NhcnUgW21haWx0bzpyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
XQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMiwgMjAxOCAyOjI2IFBNCj4gCj4gdm14X3ZtZXhp
dF9oYW5kbGVyKCkgYXNzdW1lcyB0aGF0IGlmCj4gU0VDT05EQVJZX0VYRUNfRU5BQkxFX1ZJUlRf
RVhDRVBUSU9OUyBpcyBzZXQsIHRoYXQgdGhlIHZhbHVlIGluCj4gRVBUUF9JTkRFWCBpcyB2YWxp
ZC4gIFVuZm9ydHVuYXRlbHksIHRoZSBmdW5jdGlvbiB3aGljaCBzZXRzIHRoaXMgYml0Cj4gKHZt
eF92Y3B1X3VwZGF0ZV92bWZ1bmNfdmUpIGRvZXNuJ3QgYWN0dWFsbHkgc2V0IEVQVFBfSU5ERVg7
IGl0IHdpbGwKPiBvbmx5IGJlIHNldCB0aGUgbmV4dCB0aW1lIHZteF92Y3B1X3VwZGF0ZV9lcHRw
KCkgaXMgY2FsbGVkLgo+IAo+IFRoaXMgbWVhbnMgdGhhdCBpZiBhIHZjcHUgbWFrZXMgYSB2bWV4
aXQgYmV0d2VlbiB0aGVzZSB0d28gcG9pbnRzLCB0aGUKPiBFUFRQX0lOREVYIGl0IHJlYWRzIHdp
bGwgYmUgaW52YWxpZC4gIFRoZSBmaXJzdCB0aW1lIHRoaXMgcmFjZSBoYXBwZW5zCj4gZm9yIGEg
ZG9tYWluLCBFUFRQX0lOREVYIHdpbGwgbW9zdCBsaWtlbHkgYmUgemVybywgd2hpY2ggaXMgdGhl
IGluZGV4Cj4gZm9yIHRoZSAiaG9zdCIgcDJtIC0tIGFuZCB0aHVzIGlzIG9mdGVuIGNvcnJlY3Qu
ICBCdXQgdGhlIHNlY29uZCB0aW1lCj4gdGhpcyByYWNlIGhhcHBlbnMsIHRoZSB2YWx1ZSB3aWxs
IHR5cGljYWxseSBiZSBJTlZBTElEX0FMVFAyTSwgd2hpY2gKPiB3aWxsIGhpdCB0aGUgZm9sbG93
aW5nIEJVRzoKPiAKPiAgICAgQlVHX09OKGlkeCA+PSBNQVhfQUxUUDJNKTsKPiAKPiBXb3JzZSwg
aWYgZm9yIHNvbWUgcmVhc29uIHRoZSBjdXJyZW50IGFsdHAybSB3YXMgKm5vdCogYDBgIGR1cmlu
ZyB0aGlzCj4gd2luZG93IChzYXksIGJlY2F1c2UgYSB0b29sc3RhY2sgY2hhbmdlZCB0aGUgVk0g
dG8gYSBkaWZmZXJlbnQgdmlldyksCj4gdGhlbiB0aGUgYWNjb3VudGluZyBvZiBhY3RpdmUgdmNw
dXMgZm9yIGFuIGFsdHAybSB3aWxsIGJlIHRocm93biBvZmYuCj4gCj4gRml4IHRoaXMgYnkgYWx3
YXlzIHVwZGF0aW5nIEVQVFBfSU5ERVggdG8gdGhlIGN1cnJlbnQgYWx0cDJtIGluZGV4Cj4gd2hl
biBlbmFibGluZyAjVkUuCj4gCj4gUmVwb3J0ZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNv
am9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiBUZXN0ZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNv
am9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [RFC PATCH 0/5] x86: Multiple fixes to MSR_TSC_AUX
 and RDTSCP handling for guests
Date: Fri, 9 Mar 2018 14:10:04 -0500
Message-ID: <5e85c940-a30a-2347-5d32-a36134bb38d3@oracle.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <3932aaca-1d30-85f9-b27a-c717997794fa@citrix.com>
 <fa752277-f9d1-610c-dbdf-4d9d1ab6a96a@oracle.com>
 <bd5b1055-78eb-ef1a-1c99-621ee8ed5bc2@citrix.com>
 <94216b6e-5285-d1ad-89a5-ae812051f9a0@oracle.com>
 <a863fe32-d731-6e6c-aded-957690005591@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a863fe32-d731-6e6c-aded-957690005591@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8wOS8yMDE4IDAxOjQxIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDA5LzAz
LzIwMTggMTg6MDUsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4KPj4KPj4gT24gMDIvMjYvMjAx
OCAwNjozMCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDI2LzAyLzIwMTggMTk6NDQs
IEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+PiBPbiAwMi8yNi8yMDE4IDAyOjEyIFBNLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+Pj4+PiBPbiAyMC8wMi8xOCAxMTo1OCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4+Pj4+IFRoaXMgcmF0cyBuZXN0IHdhcyBkaXNjb3ZlcmVkIHdoZW4gZmluZGluZyB0
aGF0IE1TUl9UU0NfQVVYIGxlYWtlZAo+Pj4+Pj4gaW50byBQVgo+Pj4+Pj4gZ3Vlc3RzLsKgIEl0
IGlzIFJGQyBiZWNhdXNlIEkgaGF2ZW4ndCBkb25lIGV4dGVuc2l2ZSB0ZXN0aW5nIG9uIHRoZQo+
Pj4+Pj4gcmVzdWx0LCBhbmQKPj4+Pj4+IGJlY2F1c2UgdGhlcmUgYXJlIHNvbWUgZnVuY3Rpb25h
bCBjaGFuZ2VzIGZvciB0aGUgdmlydHVhbGlzZWQgVFNDCj4+Pj4+PiBtb2Rlcy4KPj4+Pj4+Cj4+
Pj4+PiBBbmRyZXcgQ29vcGVyICg1KToKPj4+Pj4+ICDCoMKgIHg4Ni9odm06IERvbid0IHNoYWRv
dyB0aGUgZG9tYWluIHBhcmFtZXRlciBpbiBodm1fc2F2ZV9jcHVfbXNycygpCj4+Pj4+PiAgwqDC
oCB4ODYvcHY6IEF2b2lkIGxlYWtpbmcgb3RoZXIgZ3Vlc3RzJyBNU1JfVFNDX0FVWCB2YWx1ZXMg
aW50byBQVgo+Pj4+Pj4gY29udGV4dAo+Pj4+Pj4gIMKgwqAgeDg2L3RpbWU6IFJld29yayBwdl9z
b2Z0X3JkdHNjKCkgdG8gYWlkIGZ1cnRoZXIgY2xlYW51cAo+Pj4+Pj4gIMKgwqAgeDg2L3B2OiBS
ZW1vdmUgZGVmZXJyZWQgUkRUU0N7LFB9IGhhbmRsaW5nIGluCj4+Pj4+PiBwdl9lbXVsYXRlX3By
aXZpbGVnZWRfb3AoKQo+Pj4+Pj4gIMKgwqAgeDg2OiBSZXdvcmsgTVNSX1RTQ19BVVggaGFuZGxp
bmcgZnJvbSBzY3JhdGNoLgo+Pj4+PiBLb25yYWQvQm9yaXM6IENhbiB3ZSBoYXZlIGFueSBpbnB1
dCBXUlQgVFNDX01PREVfUFZSRFRTQ1AgdXNhZ2U/wqAgQXJlCj4+Pj4+IHlvdSBzdGlsbCB1c2lu
ZyB0aGUgZmVhdHVyZSwgb3IgaXMgaXQgYWJhbmRvbmVkPwo+Pj4+IEkgYWxyZWFkeSBhc2tlZCBh
IGZldyBpbnRlcm5hbCB0ZWFtcyBhYm91dCwgaGF2ZW4ndCBoZWFyZCBiYWNrLgo+Pj4KPj4+IEFo
IG9rIC0gdGhhbmtzLsKgIEknbGwgd2FpdCB0byBoZWFyIGJhY2sgZnJvbSB5b3UgdGhlbi4KPj4K
Pj4KPj4gVG9vayBsb25nZXIgdGhhbiBJIGhvcGVkLCBzb3JyeS4KPj4KPj4gQ291bGRuJ3QgZmlu
ZCBhbnlvbmUgd2hvIGlzIHN0aWxsIHVzaW5nIHRoaXMgbW9kZSAob3IgcGVyaGFwcyBub29uZQo+
PiB3YW50ZWQgdG8gYWRtaXQgdG8gdGhpcyA7LSkpLgo+IAo+IElzIHRoaXMgeW91ciAoT3JhY2xl
J3MpIGJsZXNzaW5nIHRvIHB1cmdlIHRoZSBmZWF0dXJlIGFuZCBwcmV0ZW5kIHRoYXQKPiBpdCBu
ZXZlciBleGlzdGVkPwoKCk5vdCBzdXJlIGFib3V0IHRoZSBzZWNvbmQgcGFydCBidXQgZm9yIHRo
ZSBmaXJzdCBwYXJ0IChwdXJnaW5nKSAtLS0gc3VyZS4KCi1ib3JpcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Sun, 1 Apr 2018 19:29:48 +0100
Message-ID: <e30a0355-9095-7db1-878b-8f79c8526c44@citrix.com>
References: <20180401170318.8335-1-olaf@aepfle.de>
 <ce101031-2b1f-35ad-1b31-e0869e0370f0@citrix.com>
 <20180401182524.GA1826@aepfle.de>
 <e20b37ad-8aca-d196-c45e-0673c955609e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e20b37ad-8aca-d196-c45e-0673c955609e@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMTggMTk6MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDEvMDQvMTggMTk6
MjUsIE9sYWYgSGVyaW5nIHdyb3RlOgo+PiBPbiBTdW4sIEFwciAwMSwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4KPj4+IE9uIDAxLzA0LzE4IDE4OjAzLCBPbGFmIEhlcmluZyB3cm90ZToKPj4+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfc3Jfc3RyZWFtX2Zvcm1hdC5oIGIvdG9vbHMvbGli
eGMveGNfc3Jfc3RyZWFtX2Zvcm1hdC5oCj4+Pj4gaW5kZXggMTVmZjFjN2VmYi4uOWI1MmY2YWNl
NiAxMDA2NDQKPj4+PiAtLS0gYS90b29scy9saWJ4Yy94Y19zcl9zdHJlYW1fZm9ybWF0LmgKPj4+
PiArKysgYi90b29scy9saWJ4Yy94Y19zcl9zdHJlYW1fZm9ybWF0LmgKPj4+PiBAQCAtMTIxLDcg
KzEyMSw4IEBAIHN0cnVjdCB4Y19zcl9yZWNfdHNjX2luZm8KPj4+PiAtICAgIHVpbnQzMl90IF9y
ZXMxOwo+Pj4+ICsgICAgdWludDE2X3QgdnRzY190b2xlcmFuY2U7Cj4+Pj4gKyAgICB1aW50MTZf
dCBfcmVzMTsKPj4+IFlvdSBuZWVkIHRvIHNpbWlsYXJseSB0d2VhayB2ZXJpZnlfcmVjb3JkX3Rz
Y19pbmZvKCkgaW4KPj4+IHRvb2xzL3B5dGhvbi94ZW4vbWlncmF0aW9uL2xpYnhjLnB5Cj4+IFRo
YW5rcy4gSSB0aGluayB0aGlzIHNpbXBsZSBjaGFuZ2UgaXMgZW5vdWdoPwo+IFllYWggLSBUaGF0
IGxvb2tzIG9rLCBhbHRob3VnaCBJJ2QgYWRkIGEga0h6IHVuaXQgdG8gdGhlIHByaW50ZWQgdG9s
ZXJhbmNlLgoKQW5kIGEgbGVhZGluZyBjb21tYSBmb3IgY29uc2lzdGVuY3kgd2l0aCB0aGUgcmVz
dCBvZiB0aGUgZm9ybWF0dGluZy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

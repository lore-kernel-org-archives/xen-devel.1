From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/6] x86/hvm: Handle viridian MSRs via the
 new guest_{rd, wr}msr() infrastructure
Date: Wed, 28 Feb 2018 18:14:27 +0000
Message-ID: <c28b8c9a-1298-d943-da0d-377541fbb308@citrix.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-3-git-send-email-andrew.cooper3@citrix.com>
 <20180227141352.4huilhzfnjcrzxj5@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180227141352.4huilhzfnjcrzxj5@MacBook-Pro-de-Roger.local>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDIvMTggMTQ6MTMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBGZWIg
MjYsIDIwMTggYXQgMDU6MzU6MTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQEAg
LTE3MywxMSArMTc1LDI2IEBAIGludCBndWVzdF9yZG1zcihjb25zdCBzdHJ1Y3QgdmNwdSAqdiwg
dWludDMyX3QgbXNyLCB1aW50NjRfdCAqdmFsKQo+PiAgICAgICAgICAgICAgICAgX01TUl9NSVND
X0ZFQVRVUkVTX0NQVUlEX0ZBVUxUSU5HOwo+PiAgICAgICAgICBicmVhazsKPj4gIAo+PiArICAg
IGNhc2UgMHg0MDAwMDAwMCAuLi4gMHg0MDAwMDFmZjoKPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGNs
ZWFyZXIgdG8gdXNlIFZJUklESUFOX01TUl9NSU4gLi4uCj4gVklSSURJQU5fTVNSX01BWC4KPgo+
IE9yIGVsc2UgdGhlIGRlZmluZXMgc2hvdWxkIGJlIHJlbW92ZWQgYmVjYXVzZSB5b3UgYXJlIHJl
bW92aW5nIGFsbCBvZgo+IGl0J3MgdXNlcnMuCgpCb3RoIG9mIHRoZXNlIHdvdWxkIGJlIHdyb25n
LsKgIEknbGwgcmVtb3ZlIHRoZW0gaW5zdGVhZC4KClRoZSBwcm9ibGVtIGhlcmUsIGFuZCBtb3Jl
c28gd2l0aCB0aGUgZm9sbG93aW5nIHBhdGNoLCBpcyB0aGF0IHRoZSByYW5nZQpvZiBhY2NlcHRh
YmxlIE1TUnMgZGVwZW5kcyBvbiB3aGljaCBoeXBlcnZpc29yIHdlIGFyZSBlbXVsYXRpbmcuwqAg
VXNpbmcKbmFtZWQgbGFiZWxzIGhlcmUgYWN0dWFsbHkgY29uZnVzZXMgcmF0aGVyIHRoYW4gaGVs
cHMgbWF0dGVycy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

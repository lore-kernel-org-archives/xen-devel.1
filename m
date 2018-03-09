From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [RFC PATCH 0/5] x86: Multiple fixes to MSR_TSC_AUX
 and RDTSCP handling for guests
Date: Fri, 9 Mar 2018 13:05:19 -0500
Message-ID: <94216b6e-5285-d1ad-89a5-ae812051f9a0@oracle.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <3932aaca-1d30-85f9-b27a-c717997794fa@citrix.com>
 <fa752277-f9d1-610c-dbdf-4d9d1ab6a96a@oracle.com>
 <bd5b1055-78eb-ef1a-1c99-621ee8ed5bc2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <bd5b1055-78eb-ef1a-1c99-621ee8ed5bc2@citrix.com>
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

CgpPbiAwMi8yNi8yMDE4IDA2OjMwIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDI2LzAy
LzIwMTggMTk6NDQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMDIvMjYvMjAxOCAwMjox
MiBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDIwLzAyLzE4IDExOjU4LCBBbmRyZXcg
Q29vcGVyIHdyb3RlOgo+Pj4+IFRoaXMgcmF0cyBuZXN0IHdhcyBkaXNjb3ZlcmVkIHdoZW4gZmlu
ZGluZyB0aGF0IE1TUl9UU0NfQVVYIGxlYWtlZCBpbnRvIFBWCj4+Pj4gZ3Vlc3RzLiAgSXQgaXMg
UkZDIGJlY2F1c2UgSSBoYXZlbid0IGRvbmUgZXh0ZW5zaXZlIHRlc3Rpbmcgb24gdGhlIHJlc3Vs
dCwgYW5kCj4+Pj4gYmVjYXVzZSB0aGVyZSBhcmUgc29tZSBmdW5jdGlvbmFsIGNoYW5nZXMgZm9y
IHRoZSB2aXJ0dWFsaXNlZCBUU0MgbW9kZXMuCj4+Pj4KPj4+PiBBbmRyZXcgQ29vcGVyICg1KToK
Pj4+PiAgICB4ODYvaHZtOiBEb24ndCBzaGFkb3cgdGhlIGRvbWFpbiBwYXJhbWV0ZXIgaW4gaHZt
X3NhdmVfY3B1X21zcnMoKQo+Pj4+ICAgIHg4Ni9wdjogQXZvaWQgbGVha2luZyBvdGhlciBndWVz
dHMnIE1TUl9UU0NfQVVYIHZhbHVlcyBpbnRvIFBWIGNvbnRleHQKPj4+PiAgICB4ODYvdGltZTog
UmV3b3JrIHB2X3NvZnRfcmR0c2MoKSB0byBhaWQgZnVydGhlciBjbGVhbnVwCj4+Pj4gICAgeDg2
L3B2OiBSZW1vdmUgZGVmZXJyZWQgUkRUU0N7LFB9IGhhbmRsaW5nIGluIHB2X2VtdWxhdGVfcHJp
dmlsZWdlZF9vcCgpCj4+Pj4gICAgeDg2OiBSZXdvcmsgTVNSX1RTQ19BVVggaGFuZGxpbmcgZnJv
bSBzY3JhdGNoLgo+Pj4gS29ucmFkL0JvcmlzOiBDYW4gd2UgaGF2ZSBhbnkgaW5wdXQgV1JUIFRT
Q19NT0RFX1BWUkRUU0NQIHVzYWdlPyAgQXJlCj4+PiB5b3Ugc3RpbGwgdXNpbmcgdGhlIGZlYXR1
cmUsIG9yIGlzIGl0IGFiYW5kb25lZD8KPj4gSSBhbHJlYWR5IGFza2VkIGEgZmV3IGludGVybmFs
IHRlYW1zIGFib3V0LCBoYXZlbid0IGhlYXJkIGJhY2suCj4gCj4gQWggb2sgLSB0aGFua3MuwqAg
SSdsbCB3YWl0IHRvIGhlYXIgYmFjayBmcm9tIHlvdSB0aGVuLgoKClRvb2sgbG9uZ2VyIHRoYW4g
SSBob3BlZCwgc29ycnkuCgpDb3VsZG4ndCBmaW5kIGFueW9uZSB3aG8gaXMgc3RpbGwgdXNpbmcg
dGhpcyBtb2RlIChvciBwZXJoYXBzIG5vb25lIAp3YW50ZWQgdG8gYWRtaXQgdG8gdGhpcyA7LSkp
LgoKLWJvcmlzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

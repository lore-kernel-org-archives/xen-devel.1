From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 0/5] x86: Multiple fixes to MSR_TSC_AUX
 and RDTSCP handling for guests
Date: Fri, 9 Mar 2018 18:41:33 +0000
Message-ID: <a863fe32-d731-6e6c-aded-957690005591@citrix.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <3932aaca-1d30-85f9-b27a-c717997794fa@citrix.com>
 <fa752277-f9d1-610c-dbdf-4d9d1ab6a96a@oracle.com>
 <bd5b1055-78eb-ef1a-1c99-621ee8ed5bc2@citrix.com>
 <94216b6e-5285-d1ad-89a5-ae812051f9a0@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <94216b6e-5285-d1ad-89a5-ae812051f9a0@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-devel <xen-devel@lists.xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDMvMjAxOCAxODowNSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Cj4KPiBPbiAwMi8y
Ni8yMDE4IDA2OjMwIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyNi8wMi8yMDE4IDE5
OjQ0LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+PiBPbiAwMi8yNi8yMDE4IDAyOjEyIFBNLCBB
bmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+IE9uIDIwLzAyLzE4IDExOjU4LCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+Pj4+PiBUaGlzIHJhdHMgbmVzdCB3YXMgZGlzY292ZXJlZCB3aGVuIGZpbmRpbmcg
dGhhdCBNU1JfVFNDX0FVWCBsZWFrZWQKPj4+Pj4gaW50byBQVgo+Pj4+PiBndWVzdHMuwqAgSXQg
aXMgUkZDIGJlY2F1c2UgSSBoYXZlbid0IGRvbmUgZXh0ZW5zaXZlIHRlc3Rpbmcgb24gdGhlCj4+
Pj4+IHJlc3VsdCwgYW5kCj4+Pj4+IGJlY2F1c2UgdGhlcmUgYXJlIHNvbWUgZnVuY3Rpb25hbCBj
aGFuZ2VzIGZvciB0aGUgdmlydHVhbGlzZWQgVFNDCj4+Pj4+IG1vZGVzLgo+Pj4+Pgo+Pj4+PiBB
bmRyZXcgQ29vcGVyICg1KToKPj4+Pj4gwqDCoCB4ODYvaHZtOiBEb24ndCBzaGFkb3cgdGhlIGRv
bWFpbiBwYXJhbWV0ZXIgaW4gaHZtX3NhdmVfY3B1X21zcnMoKQo+Pj4+PiDCoMKgIHg4Ni9wdjog
QXZvaWQgbGVha2luZyBvdGhlciBndWVzdHMnIE1TUl9UU0NfQVVYIHZhbHVlcyBpbnRvIFBWCj4+
Pj4+IGNvbnRleHQKPj4+Pj4gwqDCoCB4ODYvdGltZTogUmV3b3JrIHB2X3NvZnRfcmR0c2MoKSB0
byBhaWQgZnVydGhlciBjbGVhbnVwCj4+Pj4+IMKgwqAgeDg2L3B2OiBSZW1vdmUgZGVmZXJyZWQg
UkRUU0N7LFB9IGhhbmRsaW5nIGluCj4+Pj4+IHB2X2VtdWxhdGVfcHJpdmlsZWdlZF9vcCgpCj4+
Pj4+IMKgwqAgeDg2OiBSZXdvcmsgTVNSX1RTQ19BVVggaGFuZGxpbmcgZnJvbSBzY3JhdGNoLgo+
Pj4+IEtvbnJhZC9Cb3JpczogQ2FuIHdlIGhhdmUgYW55IGlucHV0IFdSVCBUU0NfTU9ERV9QVlJE
VFNDUCB1c2FnZT/CoCBBcmUKPj4+PiB5b3Ugc3RpbGwgdXNpbmcgdGhlIGZlYXR1cmUsIG9yIGlz
IGl0IGFiYW5kb25lZD8KPj4+IEkgYWxyZWFkeSBhc2tlZCBhIGZldyBpbnRlcm5hbCB0ZWFtcyBh
Ym91dCwgaGF2ZW4ndCBoZWFyZCBiYWNrLgo+Pgo+PiBBaCBvayAtIHRoYW5rcy7CoCBJJ2xsIHdh
aXQgdG8gaGVhciBiYWNrIGZyb20geW91IHRoZW4uCj4KPgo+IFRvb2sgbG9uZ2VyIHRoYW4gSSBo
b3BlZCwgc29ycnkuCj4KPiBDb3VsZG4ndCBmaW5kIGFueW9uZSB3aG8gaXMgc3RpbGwgdXNpbmcg
dGhpcyBtb2RlIChvciBwZXJoYXBzIG5vb25lCj4gd2FudGVkIHRvIGFkbWl0IHRvIHRoaXMgOy0p
KS4KCklzIHRoaXMgeW91ciAoT3JhY2xlJ3MpIGJsZXNzaW5nIHRvIHB1cmdlIHRoZSBmZWF0dXJl
IGFuZCBwcmV0ZW5kIHRoYXQKaXQgbmV2ZXIgZXhpc3RlZD8KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

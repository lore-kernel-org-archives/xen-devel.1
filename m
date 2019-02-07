From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v8 for-4.12 10/17] argo: implement the
 notify op
Date: Wed, 6 Feb 2019 22:32:05 -0800
Message-ID: <CACMJ4GZj+_YJY7O+SaxZQfWKzan+T2bKGb70EtXfXu2+P4LnSQ@mail.gmail.com>
References: <1549443308-24448-1-git-send-email-christopher.w.clark@gmail.com>
 <1549443308-24448-11-git-send-email-christopher.w.clark@gmail.com>
 <5c9d887c-7329-35a9-d98d-a9f6fe3b7486@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1jTD=QO=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1grdET-000898-58
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 06:32:21 +0000
Received: by mail-lf1-x143.google.com with SMTP id j1so7270244lfb.10
 for <xen-devel@lists.xenproject.org>; Wed, 06 Feb 2019 22:32:19 -0800 (PST)
In-Reply-To: <5c9d887c-7329-35a9-d98d-a9f6fe3b7486@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgNiwgMjAxOSBhdCAxMDoyOCBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMi82LzE5IDg6NTUgQU0sIENocmlzdG9w
aGVyIENsYXJrIHdyb3RlOgo+ID4gKy8qCj4gPiArICogWEVOX0FSR09fT1Bfbm90aWZ5Cj4gPiAr
ICoKPiA+ICsgKiBBc2tzIFhlbiBmb3IgaW5mb3JtYXRpb24gYWJvdXQgb3RoZXIgcmluZ3MgaW4g
dGhlIHN5c3RlbS4KPiA+ICsgKgo+ID4gKyAqIGVudC0+cmluZyBpcyB0aGUgeGVuX2FyZ29fYWRk
cl90IG9mIHRoZSByaW5nIHlvdSB3YW50IGluZm9ybWF0aW9uIG9uLgo+ID4gKyAqIFVzZXMgdGhl
IHNhbWUgcmluZyBtYXRjaGluZyBydWxlcyBhcyBYRU5fQVJHT19PUF9zZW5kdi4KPiA+ICsgKgo+
ID4gKyAqIGVudC0+c3BhY2VfcmVxdWlyZWQgOiBpZiB0aGlzIGZpZWxkIGlzIG5vdCBudWxsIHRo
ZW4gWGVuIHdpbGwgY2hlY2sKPiA+ICsgKiB0aGF0IHRoZXJlIGlzIHNwYWNlIGluIHRoZSBkZXN0
aW5hdGlvbiByaW5nIGZvciB0aGlzIG1hbnkgYnl0ZXMgb2YgcGF5bG9hZC4KPiA+ICsgKiBJZiB0
aGUgcmluZyBpcyB0b28gc21hbGwgZm9yIHRoZSByZXF1ZXN0ZWQgc3BhY2VfcmVxdWlyZWQsIGl0
IHdpbGwgc2V0IHRoZQo+ID4gKyAqIFhFTl9BUkdPX1JJTkdfRU1TR1NJWkUgZmxhZyBvbiByZXR1
cm4uCj4gPiArICogSWYgc3VmZmljaWVudCBzcGFjZSBpcyBhdmFpbGFibGUsIGl0IHdpbGwgc2V0
IFhFTl9BUkdPX1JJTkdfU1VGRklDSUVOVAo+ID4gKyAqIGFuZCBDQU5DRUwgYW55IHBlbmRpbmcg
bm90aWZpY2F0aW9uIGZvciB0aGF0IGVudC0+cmluZzsgb3RoZXJ3aXNlIGl0Cj4gPiArICogd2ls
bCBzY2hlZHVsZSBhIG5vdGlmaWNhdGlvbiBldmVudCBhbmQgdGhlIGZsYWcgd2lsbCBub3QgYmUg
c2V0Lgo+ID4gKyAqCj4gPiArICogVGhlc2UgZmxhZ3MgYXJlIHNldCBieSBYZW4gd2hlbiBub3Rp
ZnkgcmVwbGllczoKPiA+ICsgKiBYRU5fQVJHT19SSU5HX0VYSVNUUyAgICAgcmluZyBleGlzdHMK
PiA+ICsgKiBYRU5fQVJHT19SSU5HX1NIQVJFRCAgICAgcmluZyBpcyByZWdpc3RlcmVkIGZvciB3
aWxkY2FyZCBwYXJ0bmVyCj4gPiArICogWEVOX0FSR09fUklOR19FTVBUWSAgICAgIHJpbmcgaXMg
ZW1wdHkKPiA+ICsgKiBYRU5fQVJHT19SSU5HX1NVRkZJQ0lFTlQgc3VmZmljaWVudCBzcGFjZSBm
b3Igc3BhY2VfcmVxdWlyZWQgaXMgdGhlcmUKPiA+ICsgKiBYRU5fQVJHT19SSU5HX0VNU0dTSVpF
ICAgc3BhY2VfcmVxdWlyZWQgaXMgdG9vIGxhcmdlIGZvciB0aGUgcmluZyBzaXplCj4gPiArICog
WEVOX0FSR09fUklOR19FQlVTWSAgICAgIHRvbyBtYW55IGRvbWFpbnMgd2FpdGluZyBmb3IgYXZh
aWxhYmxlIHNwYWNlIHNpZ25hbHMKPiA+ICsgKgo+ID4gKyAqIGFyZzE6IFhFTl9HVUVTVF9IQU5E
TEUoeGVuX2FyZ29fcmluZ19kYXRhX3QpIHJpbmdfZGF0YSAobWF5IGJlIE5VTEwpCj4gPiArICog
YXJnMjogTlVMTAo+Cj4gTklUOiBXaGlsZSBsb29raW5nIGF0IGFsbCB0aGUgaHlwZXJjYWxsLCBJ
IG5vdGljZWQgeW91IHNheSBOVUxMIGhlcmUuIEluCj4gbW9zdCBvZiB0aGUgY2FzZXMsIE5VTEwg
d2lsbCBiZSAwIGJ1dCB0aGVyZSBhcmUgcGxhY2Ugd2hlcmUgaXQgbWlnaHQgbm90Cj4gYmUuIFNv
IHdoYXQgaXMgdGhlIGV4YWN0IHZhbHVlIHlvdSBleHBlY3QgaGVyZT8KClRoZSBpbXBsZW1lbnRh
dGlvbiB0ZXN0cyBib3RoIGFyZzEgYW5kIGFyZzIgd2l0aDogZ3Vlc3RfaGFuZGxlX2lzX251bGwK
CndoaWNoIG9uIGJvdGggeDg2IGFuZCBBUk0gZXhwYW5kcyB0bzogKChobmQpLnAgPT0gTlVMTCkK
Ckl0IHVzZXMgdGhhdCBudWxsIHRlc3QgYmVjYXVzZSBib3RoIGFyZSBYRU5fR1VFU1RfSEFORExF
X1BBUkFNIHR5cGUgaW4KdGhlIGZ1bmN0aW9uIHNpZ25hdHVyZToKCmxvbmcgZG9fYXJnb19vcCgK
ICAgIHVuc2lnbmVkIGludCBjbWQsCiAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFy
ZzEsCiAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZzIsCiAgICB1bnNpZ25lZCBs
b25nIGFyZzMsCiAgICB1bnNpZ25lZCBsb25nIGFyZzQpOwoKYW5kIHNpbmNlIGl0IGRvZXMgdGhh
dCwgdGhlIGNvbW1lbnQgc3RhdGVzIE5VTEwgcmF0aGVyIHRoYW4gemVyby4KCkl0IGlzIFhlbidz
IGRlZmluaXRpb24gZm9yIE5VTEwgdGhhdCBpcyB1c2VkLCBzbyB0aGUgZXhwZWN0ZWQgdmFsdWUg
aW4KdGhlIHJlZ2lzdGVyIHdoZW4gdGhlIGh5cGVyY2FsbCBpcyBpbnZva2VkIGlzOiB6ZXJvLgoK
PiA+ICsgKiBhcmczOiAwIChaRVJPKQo+ID4gKyAqIGFyZzQ6IDAgKFpFUk8pCj4KPiBOSVQ6IEkg
Z3Vlc3MgdGhvc2UgdG8gd2lsbCBiZSAwIGluIGFuIHVuc2lnbmVkIGxvbmcgdmFsdWU/CgpZZXMu
CgpDaHJpc3RvcGhlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

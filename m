From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Xen Introspection, KPTI,
 and CR3 bit 63 leads to guest VMENTRY failures during introspection
Date: Thu, 25 Jan 2018 09:38:26 +0200
Message-ID: <c4b63016-2d7c-81a6-d78c-fd7359ac1567@bitdefender.com>
References: <CALn24pArgwLSBy7TO0j4gcqXdzJ5pqmW_koKP7-Lfg8FXrOZEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CALn24pArgwLSBy7TO0j4gcqXdzJ5pqmW_koKP7-Lfg8FXrOZEQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Bitweasil ." <bitweasil@cryptohaze.com>, xen-devel@lists.xen.org
Cc: andrew.cooper3@citrix.com, tamas@tklengyel.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjUvMjAxOCAxMjozMSBBTSwgQml0d2Vhc2lsIC4gd3JvdGU6Cj4gSSd2ZSByZWNlbnRs
eSBkaXNjb3ZlcmVkIHRoYXQgaWYgeW91IGF0dGVtcHQgdG8gdXNlIGludHJvc3BlY3Rpb24gdG8K
PiBjYXB0dXJlIENSMyBjaGFuZ2VzIHdpdGggdGhlIG5ldyBLUFRJIGVuYWJsZWQga2VybmVscywg
dGhlIGd1ZXN0IGRpZXMKPiBzaG9ydGx5IGFmdGVyIHRoZSBzdGFydCBvZiBpbnRyb3NwZWN0aW9u
IHdpdGggZmFpbGVkIFZNIGVudHJ5IGR1ZSB0bwo+IGludmFsaWQgZ3Vlc3Qgc3RhdGUuCj4gCj4g
SSBiZWxpZXZlIHRoZSBpbnZhbGlkIHN0YXRlIGhlcmUgaXMgdGhlIGhpZ2ggYml0IGJlaW5nIHNl
dCBpbiBDUjMgLQo+IHdoaWxlIHRoaXMgaXMgaG93IG9uZSBpbmRpY2F0ZXMgdGhhdCBQQ0lEIHNo
b3VsZCBub3QgaW52YWxpZGF0ZSB0aGUKPiB2YXJpb3VzIHBhZ2UgdGFibGUgY2FjaGVzLCBpbnRy
b3NwZWN0aW9uIGxlYWRzIHRvIHRoaXMgYmVpbmcgc2V0IGluIHRoZQo+IFZNQ1MsIHdoaWNoIGFw
cGVhcnMgdG8gYmUgd3JvbmcuCk91ciBzb2x1dGlvbiBkb2Vzbid0IGludGVyY2VwdCBDUjMgd3Jp
dGVzIChhbmQgaGFzbid0IGZvciBhIHdoaWxlKSwgc28KaXQgaXMgdW5hZmZlY3RlZCAoYW5kIHRo
aXMgZXhwbGFpbnMgd2h5IHdlIGhhdmVuJ3QgY29tZSBhY3Jvc3MgdGhpcwppc3N1ZSkuIEJ1dCB0
aGUgcHJvYmxlbSBzaG91bGQgY2xlYXJseSBiZSBzb2x2ZWQgLSBhbHRob3VnaCBhdCB0aGlzCnBv
aW50IGl0IGxvb2tzIGxpa2UgdGhlIGZpeCBpcyBzb21ld2hlcmUgZGVlcGVyIHRoYW4gdGhlIGlu
dHJvc3BlY3Rpb24KbGF5ZXIuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

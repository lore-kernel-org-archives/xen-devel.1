From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 1/4] asm-x86/monitor: Fix monitor
 capability reporting on SVM systems
Date: Wed, 14 Feb 2018 14:34:30 -0700
Message-ID: <CABfawhkiw8HGr_bPKt73r85R8L29pVasBAWDNqZU6627==EoeQ@mail.gmail.com>
References: <1518448098-6493-1-git-send-email-aisaila@bitdefender.com>
 <1518448098-6493-2-git-send-email-aisaila@bitdefender.com>
 <fee0cab0-dc3f-eb13-b225-f1f356e934ab@citrix.com>
 <80320fb1-0228-27f6-4297-cb4946738076@citrix.com>
 <7636b11b-69b3-60fa-2455-4bf3c1dbe4e1@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7636b11b-69b3-60fa-2455-4bf3c1dbe4e1@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Alexandru Isaila <aisaila@bitdefender.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMTQsIDIwMTggYXQgMTA6NTYgQU0sIFJhenZhbiBDb2pvY2FydQo8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4gT24gMDIvMTQvMjAxOCAwNzo0NyBQTSwgQW5k
cmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMDIvMTggMTU6MTMsIEFuZHJldyBDb29wZXIgd3Jv
dGU6Cj4+PiBPbiAxMi8wMi8xOCAxNTowOCwgQWxleGFuZHJ1IElzYWlsYSB3cm90ZToKPj4+PiBO
byBtb25pdG9yIGZlYXR1cmVzIGFyZSBhdmFpbGFibGUgb24gQU1EIGFuZCBhbGwKPj4+PiBjYXBh
YmlsaXRpZXMgYXJlIHBhc3NlZCBvbmx5IHRvIHRoZSBJbnRlbCBwcm9jZXNzb3IgYXJjaGl0ZWN0
dXJlLgo+Pj4+IFRoaXMgbWVhbnMgdGhhdCB0aGUgYXJjaF9tb25pdG9yX2dldF9jYXBhYmlsaXRp
ZXMgcmV0dXJucwo+Pj4+IGNhcGFiaWxpdGllcyA9IDAuCj4+Pj4KPj4+PiBUaGlzIHBhdGNoIGlz
IHNlcGFyYXRpbmcgb3V0IGZlYXR1cmVzIHdoaWNoIGFyZSBpbXBsZW1lbnRlZCBvbiBib3RoCj4+
Pj4gc3lzdGVtcyBmcm9tIHRob3NlIGltcGxlbWVudGVkIG9ubHkgb24gSW50ZWwsIHNvIHRoYXQg
d2UgYWR2ZXJ0aXplIHRoZQo+Pj4+IHdvcmtpbmcgY2FwYWJpbGl0aWVzIG9uIEFNRC4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIu
Y29tPgo+Pgo+PiBUaGlzIHBhdGNoIHN0aWxsIG5lZWRzIGFuIGFjayBmcm9tIFRhbWFzIG9yIFJh
enZhbiwgYnV0IHRoZXJlIGlzIG5vCj4+IGNvbW1lbnQgc28gZmFyIHRoYXQgSSBjYW4gZmluZC4K
Pgo+IEkgdGhpbmsgVGFtYXMgcHJvYmFibHkgd291bGRuJ3Qgb2JqZWN0LCBzbyBGV0lXOgo+Cj4g
QWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KClll
cywgdGhpcyBsb29rcyBmaW5lIHRvIG1lIHRvbzoKCkFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

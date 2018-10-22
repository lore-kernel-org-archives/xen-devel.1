From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 08/18] xen: add basic hooks for PVH in
 current code
Date: Mon, 22 Oct 2018 13:18:08 +0200
Message-ID: <44d0a813-b568-1135-a002-503935157844__43297.9674231776$1540207016$gmane$org@suse.com>
References: <20181009110317.6022-1-jgross@suse.com>
 <20181009110317.6022-9-jgross@suse.com>
 <20181019153327.giznmhrlxxjjmjsb@mac.bytemobile.com>
 <f932643f-bdce-7bed-55d2-39addfda50d2@suse.com>
 <20181022111609.GA4548@olila.i.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181022111609.GA4548@olila.i.net-space.pl>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: The development of GNU GRUB <grub-devel@gnu.org>, Daniel Kiper <daniel.kiper@oracle.com>
Cc: hans@knorrie.org, phcoder@gmail.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTAvMjAxOCAxMzoxNiwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+IE9uIEZyaSwgT2N0IDE5
LCAyMDE4IGF0IDA1OjUyOjQ0UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDE5
LzEwLzIwMTggMTc6MzMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBUdWUsIE9jdCAw
OSwgMjAxOCBhdCAwMTowMzowN1BNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+IEFk
ZCB0aGUgaG9va3MgdG8gY3VycmVudCBjb2RlIG5lZWRlZCBmb3IgWGVuIFBWSC4KPj4+Pgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+PiAtLS0K
Pj4+PiAgZ3J1Yi1jb3JlL2tlcm4vaTM4Ni94ZW4vcHZoLmMgICAgICAgICB8IDM2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gIGdydWItY29yZS9rZXJuL2kzODYveGVu
L3N0YXJ0dXBfcHZoLlMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gIGdy
dWItY29yZS9rZXJuL3hlbi9pbml0LmMgICAgICAgICAgICAgfCAgNiArKysrKysKPj4+PiAgaW5j
bHVkZS9ncnViL2kzODYveGVucHZoL2tlcm5lbC5oICAgICB8IDMwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+Pj4gIGluY2x1ZGUvZ3J1Yi94ZW4uaCAgICAgICAgICAgICAgICAgICAg
fCAgNiArKysrKysKPj4+PiAgNSBmaWxlcyBjaGFuZ2VkLCAxMDcgaW5zZXJ0aW9ucygrKQo+Pj4+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZ3J1Yi1jb3JlL2tlcm4vaTM4Ni94ZW4vcHZoLmMKPj4+PiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGdydWItY29yZS9rZXJuL2kzODYveGVuL3N0YXJ0dXBfcHZoLlMK
Pj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZ3J1Yi9pMzg2L3hlbnB2aC9rZXJuZWwu
aAo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2dydWItY29yZS9rZXJuL2kzODYveGVuL3B2aC5jIGIv
Z3J1Yi1jb3JlL2tlcm4vaTM4Ni94ZW4vcHZoLmMKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
Pj4+IGluZGV4IDAwMDAwMDAwMC4uMTgyZWY5NWY5Cj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsr
KyBiL2dydWItY29yZS9rZXJuL2kzODYveGVuL3B2aC5jCj4+Pj4gQEAgLTAsMCArMSwzNiBAQAo+
Pj4+ICsvKgo+Pj4+ICsgKiAgR1JVQiAgLS0gIEdSYW5kIFVuaWZpZWQgQm9vdGxvYWRlcgo+Pj4+
ICsgKiAgQ29weXJpZ2h0IChDKSAyMDExICBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4K
Pj4+Cj4+PiBJc24ndCB0aGlzIGhlYWRlciAoYW5kIHRoZSBvbmVzIGJlbG93KSBraW5kIG9mIG9m
ZiBhdCBsZWFzdCB5ZWFyCj4+PiB3aXNlPwo+Pgo+PiBIbW0sIG9ubHkgYSBsaXR0bGUgYml0IDot
KQo+Pgo+PiBXaWxsIHVwZGF0ZS4KPiAKPiBQbGVhc2UgZG8gdGhpcyBmb3IgYWxsIGhlYWRlcnMg
aW4gdGhlIHBhdGNoc2V0CgpUaGF0IHdhcyBteSBwbGFuIDotKQoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

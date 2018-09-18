From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] x86: fix "xpti=" and "pv-l1tf=" yet again
Date: Tue, 18 Sep 2018 06:41:06 -0600
Message-ID: <5BA0F26202000078001E970E@prv1-mh.provo.novell.com>
References: <5B7BED1B02000078001E063C@prv1-mh.provo.novell.com>
 <d17ea7a1-87db-0926-5ac9-cd6be3ef8523@citrix.com>
 <5B977AE902000078001E708A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2FJW-0005pk-2G
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 12:41:10 +0000
In-Reply-To: <5B977AE902000078001E708A@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGluZz8KCj4+PiBPbiAxMS4wOS4xOCBhdCAxMDoyMCwgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4+PiBPbiAyOS4wOC4xOCBhdCAxNDozNiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
IHdyb3RlOgo+PiBPbiAyMS8wOC8xOCAxMTo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBXaGls
ZSBjb21taXQgMmEzYjM0ZWM0NyAoIng4Ni9zcGVjLWN0cmw6IFlldCBtb3JlIGZpeGVzIGZvciB4
cHRpPQo+Pj4gcGFyc2luZyIpIGluZGVlZCBmaXhlZCAieHB0aT1kb20wIiwgaXQgYnJva2UgInhw
dGk9bm8tZG9tMCIsIGluIHRoYXQKPj4+IHRoaXMgdGhlbiBiZWNhbWUgZXF1aXZhbGVudCB0byAi
eHB0aT1ubyIuCj4+IAo+PiBUaGF0IHdhcyBhY2NpZGVudGFsLCBidXQgdGhlIGVuZCByZXN1bHQg
aXMgY29uc2lzdGVudCB3aXRoIG90aGVyIG9wdGlvbnMuCj4+IAo+PiBBcyB3aXRoIHNwZWMtY3Ry
bCwgaWYgc29tZW9uZSB3YW50cyB0byBzdGFydCBtYWtpbmcgZmluZS1ncmFpbiBjb250cm9sLAo+
PiB0aGV5IHNob3VsZCBzcGVjaWZ5IGV2ZXJ5dGhpbmcuICBUaGVyZSBpcyBhIHJlYXNvbiB3aHkg
dGhlCj4+IAo+PiAqKldBUk5JTkc6IEFueSB1c2Ugb2YgdGhpcyBvcHRpb24gbWF5IGludGVyZmVy
ZSB3aXRoIGhldXJpc3RpY3MuICBVc2UKPj4gd2l0aCBleHRyZW1lIGNhcmUuKioKPj4gCj4+IGRp
c2NsYWltZXIgZXhpc3RzLgo+IAo+IEkndmUgbG9va2VkIGFnYWluOiBTdWNoIGEgZGlzY2xhaW1l
ciBkb2VzIG5vdCBleGlzdCBmb3IgeHB0aT0gbm9yCj4gcHYtbDF0Zj0sIGFuZCBpdCBzaG91bGRu
J3QsIGFzIHVzZSBvZiB0aGVzZSBvcHRpb25zIGRvZXMgbm90IGluIGZhY3QKPiBpbnRlcmZlcmUg
d2l0aCBhbnkgKG90aGVyKSBoZXVyaXN0aWNzICh0aGV5J3JlIHNlcGFyYXRlIG9wdGlvbnMgZm9y
Cj4gcmVhc29ucyBiZXlvbmQgc3ludGF4IGlzc3VlcyB0aGF0IHdvdWxkIHJlc3VsdCBpZiB0aGV5
IHdlcmUgZm9sZGVkCj4gaW50byBzcGVjLWN0cmw9ICkuCj4gCj4gSWYgdGhlIHNvbGUgcmVtYWlu
aW5nIGNoYW5nZSByZXF1ZXN0IHdhcyB0byBzcGxpdCB0aGUgdmFyaWFibGVzIGludG8KPiBzZXBh
cmF0ZSBib29sZWFucywgSSBjYW4gZG8gdGhhdCAoYWx0aG91Z2gsIGFzIHNhaWQsIEknbSBub3QK
PiBjb252aW5jZWQgdGhpcyBpcyBoZWxwZnVsKS4gQnV0IHRoZXJlIHdlcmUgb3RoZXIgb3BlbiBw
b2ludHMsIGFuZAo+IEknZCBwcmVmZXIgdG8gZWl0aGVyIGNvbW1pdCB2MSB3aXRoIHRoZSBvbmUg
Y29weS1hbmQtcGFzdGUgYnVnCj4gZml4ZWQsIG9yIHNlbmQgYSB2MiB3aGljaCBoYXMgYSBjaGFu
Y2Ugb2YgYmVpbmcgYWNjZXB0ZWQgKGkuZS4KPiB3aXRoIGFsbCBvcGVuIHBvaW50cyBhZGRyZXNz
ZWQgdmVyYmFsbHkgb3IgYnkgY29kZSBjaGFuZ2VzKS4KPiAKPiBKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

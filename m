From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] mm: don't defer struct page initialization
 for Xen pv guests
Date: Fri, 16 Feb 2018 14:59:40 +0100
Message-ID: <20180216135940.GQ7275__20698.3532676988$1518789526$gmane$org@dhcp22.suse.cz>
References: <20180216133726.30813-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rgff=fk=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1emgYG-0003Vt-AU
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 13:59:48 +0000
Content-Disposition: inline
In-Reply-To: <20180216133726.30813-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Pavel Tatashin <pasha.tatashin@oracle.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org, akpm@linux-foundation.org
List-Id: xen-devel@lists.xenproject.org

W0NDIFBhdmVsXQoKT24gRnJpIDE2LTAyLTE4IDE0OjM3OjI2LCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+IENvbW1pdCBmN2Y5OTEwMGQ4ZDk1ZGJjZjA5ZTAyMTZhMTQzMjExZTc5NDE4YjlmICgibW06
IHN0b3AgemVyb2luZwo+IG1lbW9yeSBkdXJpbmcgYWxsb2NhdGlvbiBpbiB2bWVtbWFwIikgYnJv
a2UgWGVuIHB2IGRvbWFpbnMgaW4gc29tZQo+IGNvbmZpZ3VyYXRpb25zLCBhcyB0aGUgIlBpbm5l
ZCIgaW5mb3JtYXRpb24gaW4gc3RydWN0IHBhZ2Ugb2YgZWFybHkKPiBwYWdlIHRhYmxlcyBjb3Vs
ZCBnZXQgbG9zdC4KCkNvdWxkIHlvdSBiZSBtb3JlIHNwZWNpZmljIHBsZWFzZT8KCj4gQXZvaWQg
dGhpcyBwcm9ibGVtIGJ5IG5vdCBkZWZlcnJpbmcgc3RydWN0IHBhZ2UgaW5pdGlhbGl6YXRpb24g
d2hlbgo+IHJ1bm5pbmcgYXMgWGVuIHB2IGd1ZXN0Lgo+IAo+IENjOiA8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4gIzQuMTUKRml4ZXM6IGY3Zjk5MTAwZDhkOSAoIm1tOiBzdG9wIHplcm9pbmcgbWVt
b3J5IGR1cmluZyBhbGxvY2F0aW9uIGluIHZtZW1tYXAiKQoKcGxlYXNlCgo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAgbW0vcGFnZV9hbGxv
Yy5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdlX2FsbG9jLmMKPiBpbmRleCA4MWUxOGNl
ZWY1NzkuLjY4MWQ1MDRiOWE0MCAxMDA2NDQKPiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPiArKysg
Yi9tbS9wYWdlX2FsbG9jLmMKPiBAQCAtMzQ3LDYgKzM0Nyw5IEBAIHN0YXRpYyBpbmxpbmUgYm9v
bCB1cGRhdGVfZGVmZXJfaW5pdChwZ19kYXRhX3QgKnBnZGF0LAo+ICAJLyogQWx3YXlzIHBvcHVs
YXRlIGxvdyB6b25lcyBmb3IgYWRkcmVzcy1jb25zdHJhaW5lZCBhbGxvY2F0aW9ucyAqLwo+ICAJ
aWYgKHpvbmVfZW5kIDwgcGdkYXRfZW5kX3BmbihwZ2RhdCkpCj4gIAkJcmV0dXJuIHRydWU7Cj4g
KwkvKiBYZW4gUFYgZG9tYWlucyBuZWVkIHBhZ2Ugc3RydWN0dXJlcyBlYXJseSAqLwo+ICsJaWYg
KHhlbl9wdl9kb21haW4oKSkKPiArCQlyZXR1cm4gdHJ1ZTsKPiAgCSgqbnJfaW5pdGlhbGlzZWQp
Kys7Cj4gIAlpZiAoKCpucl9pbml0aWFsaXNlZCA+IHBnZGF0LT5zdGF0aWNfaW5pdF9wZ2NudCkg
JiYKPiAgCSAgICAocGZuICYgKFBBR0VTX1BFUl9TRUNUSU9OIC0gMSkpID09IDApIHsKPiAtLSAK
PiAyLjEzLjYKCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

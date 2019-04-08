From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] docs/xl: Clarify documentation for
 mem-max and mem-set
Date: Mon, 8 Apr 2019 13:52:49 +0200
Message-ID: <b0f91c53-a024-8eea-aba0-cb177769acfe@suse.com>
References: <20190408110943.8987-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CdzU=SK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hDSpd-0005K6-CT
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 11:52:57 +0000
In-Reply-To: <20190408110943.8987-1-george.dunlap@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDQvMjAxOSAxMzowOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBtZW0tc2V0IGlzIHRo
ZSBwcmltYXJ5IGNvbW1hbmQgdGhhdCB1c2VycyB3aWxsIG5lZWQgdG8gdXNlIGFuZAo+IHVuZGVy
c3RhbmQuICBNb3ZlIGl0IGZpcnN0LCBhbmQgY2xhcmlmeSB0aGUgd29yZGluZzsgYWxzbyBzcGVj
aWZ5IHRoYXQKPiB5b3UgY2FuJ3Qgc2V0IHRoZSB0YXJnZXQgaGlnaGVyIHRoYW4gbWF4bWVtIGZy
b20gdGhlIGRvbWFpbiBjb25maWcuCj4gCj4gbWVtLW1heCBpcyBhY3R1YWxseSBhIHByZXR0eSB1
c2VsZXNzIGNvbW1hbmQgYXQgdGhlIG1vbWVudC4gIENsYXJpZnkKPiB0aGF0IHVzZXJzIGFyZSBu
b3QgZXhwZWN0ZWQgdG8gdXNlIGl0OyBhbmQgZG9jdW1lbnQgYWxsIG9mIGl0cyBxdWlya3kKPiBi
ZWhhdmlvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+Cj4gLS0tCj4gdjI6Cj4gLSBSZXdvcmQgbWVtb3J5IHVuaXQgc2VjdGlvbiBi
YXNlZCBvbiByZXZpZXcgZmVlZGJhY2sKPiAKPiBJJ20gYWN0dWxseSBzb21ld2hhdCB0ZW1wdGVk
IHRvIHRha2Ugb3V0IHRoZSBlbnRyeSBmb3IgbWVtLW1heAo+IGVudGlyZWx5IC0tIGl0J3Mgbm90
IGF0IGFsbCBjbGVhciB0byBtZSB3aGF0IGFueW9uZSB3b3VsZCB1c2UgaXQgZm9yLAo+IGFuZCBp
dCdzIG9ubHkgbGlrZWx5IHRvIGNvbmZ1c2UgcGVvcGxlLgoKSXQgaXMgbmVlZGVkIGZvciBiZWlu
ZyBhYmxlIHRvIGhvdHBsdWcgbWVtb3J5IHRvIGEgZG9tYWluLgoKWW91J2xsIG5lZWQgdG86Cgot
IHJhaXNlIHRoZSBsaW1pdCBvZiB0aGUgZG9tYWluIHZpYSB4bCBtZW0tbWF4Ci0gbW9kaWZ5IHRo
ZSBzdGF0aWMtbWF4IHhlbnN0b3JlIGVudHJ5Ci0gdHJpZ2dlciBob3RwbHVnIGluIHRoZSBkb21h
aW4gKGUuZy4gdmlhIEFDUEkgaW4gSFZNKQoKTWFraW5nIHRoZSBpbnRlcmZhY2UgbW9yZSB1c2Fi
bGUgaXMgb24gbXkgYWdlbmRhIGZvciBxdWl0ZSBhIHdoaWxlIG5vdywKYnV0IEkgaGF2ZSBiZWVu
IHRvbyBidXN5IHdpdGggb3RoZXIgc3R1ZmYgbGF0ZWx5LgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

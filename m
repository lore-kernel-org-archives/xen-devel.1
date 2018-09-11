From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] schedule: move last_run_time to the credit
 scheduler privates
Date: Tue, 11 Sep 2018 02:29:51 -0600
Message-ID: <5B977CFF02000078001E70C1@prv1-mh.provo.novell.com>
References: <1536653449-26496-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fze3Z-0007PR-13
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 08:29:57 +0000
In-Reply-To: <1536653449-26496-1-git-send-email-andrii.anisov@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrii.anisov@gmail.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA5LjE4IGF0IDEwOjEwLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IEZyb206IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gCj4gVGhl
IHN0cnVjdHVyZSBtZW1iZXIgbGFzdF9ydW5fdGltZSBpcyB1c2VkIGJ5IGEgY3JlZGl0IHNjaGVk
dWxlciBvbmx5Lgo+IFNvIG1vdmUgaXQgZnJvbSBhIGdlbmVyaWMgdmNwdSBzY3RydWN0dXJlIHRv
IHRoZSBjcmVkaXQgc2NoZWR1bGVyIHByaXZhdGUKPiB2Y3B1IGRlZmluaXRpb24uCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPiAtLS0K
PiAgeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyB8IDEyICsrKysrKysrKy0tLQo+ICB4ZW4vY29t
bW9uL3NjaGVkdWxlLmMgICAgIHwgIDEgLQo+ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgIHwg
IDMgLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jIGIveGVuL2NvbW1v
bi9zY2hlZF9jcmVkaXQuYwo+IGluZGV4IDg0ZTc0NGIuLjcxNzAxNzIgMTAwNjQ0Cj4gLS0tIGEv
eGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0
LmMKPiBAQCAtMTc1LDYgKzE3NSw5IEBAIHN0cnVjdCBjc2NoZWRfdmNwdSB7Cj4gICAgICBhdG9t
aWNfdCBjcmVkaXQ7Cj4gICAgICB1bnNpZ25lZCBpbnQgcmVzaWR1YWw7Cj4gIAo+ICsgICAgLyog
bGFzdCB0aW1lIHdoZW4gdkNQVSBpcyBzY2hlZHVsZWQgb3V0ICovCj4gKyAgICB1aW50NjRfdCBs
YXN0X3J1bl90aW1lOwo+ICsKPiAgI2lmZGVmIENTQ0hFRF9TVEFUUwo+ICAgICAgc3RydWN0IHsK
PiAgICAgICAgICBpbnQgY3JlZGl0X2xhc3Q7Cj4gQEAgLTcwMSwxMCArNzA0LDExIEBAIHN0YXRp
YyB1bnNpZ25lZCBpbnQgdmNwdV9taWdyYXRpb25fZGVsYXlfdXM7Cj4gIGludGVnZXJfcGFyYW0o
InZjcHVfbWlncmF0aW9uX2RlbGF5IiwgdmNwdV9taWdyYXRpb25fZGVsYXlfdXMpOwo+ICAKPiAg
c3RhdGljIGlubGluZSBib29sCj4gLV9fY3NjaGVkX3ZjcHVfaXNfY2FjaGVfaG90KGNvbnN0IHN0
cnVjdCBjc2NoZWRfcHJpdmF0ZSAqcHJ2LCBzdHJ1Y3QgdmNwdSAqdikKPiArX19jc2NoZWRfdmNw
dV9pc19jYWNoZV9ob3QoY29uc3Qgc3RydWN0IGNzY2hlZF9wcml2YXRlICpwcnYsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjc2NoZWRfdmNwdSAqIHNjdXJyKQoKU3RyYXkg
YmxhbmssIGFuZCBpdCBsb29rcyBsaWtlIHRoZSBwYXJhbWV0ZXIgY2FuIGJlIHBvaW50ZXIgdG8g
Y29uc3QuClNpbWlsYXIgZnVydGhlciBkb3duLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

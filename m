From: Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL v2 10/19] xen: Add only xen-sysdev to dynamic
	sysbus device list
Date: Fri, 19 Jan 2018 14:33:36 -0200
Message-ID: <20180119163345.10649-11-ehabkost@redhat.com>
References: <20180119163345.10649-1-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bhdr=eo=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1ecZdO-00013t-F5
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 16:35:18 +0000
In-Reply-To: <20180119163345.10649-1-ehabkost@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBubyBuZWVkIHRvIG1ha2UgdGhlIG1hY2hpbmUgYWxsb3cgZXZlcnkgcG9zc2libGUg
c3lzYnVzCmRldmljZS4gIFdlIGNhbiBub3cganVzdCBhZGQgeGVuLXN5c2RldiB0byB0aGUgYWxs
b3dlZCBsaXN0LgoKQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KQ2M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+ClNpZ25lZC1vZmYtYnk6IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVkaGF0LmNv
bT4KTWVzc2FnZS1JZDogPDIwMTcxMTI1MTUxNjEwLjIwNTQ3LTYtZWhhYmtvc3RAcmVkaGF0LmNv
bT4KUmV2aWV3ZWQtYnk6IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRo
YXQuY29tPgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+ClNpZ25lZC1vZmYtYnk6IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVkaGF0LmNvbT4K
LS0tCiBody94ZW4veGVuX2JhY2tlbmQuYyB8IDcgKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW5fYmFj
a2VuZC5jIGIvaHcveGVuL3hlbl9iYWNrZW5kLmMKaW5kZXggODIzODBlYTllZS4uNzQ0NWI1MDZh
YyAxMDA2NDQKLS0tIGEvaHcveGVuL3hlbl9iYWNrZW5kLmMKKysrIGIvaHcveGVuL3hlbl9iYWNr
ZW5kLmMKQEAgLTU2NCwxMiArNTY0LDcgQEAgc3RhdGljIHZvaWQgeGVuX3NldF9keW5hbWljX3N5
c2J1cyh2b2lkKQogICAgIE9iamVjdENsYXNzICpvYyA9IG9iamVjdF9nZXRfY2xhc3MobWFjaGlu
ZSk7CiAgICAgTWFjaGluZUNsYXNzICptYyA9IE1BQ0hJTkVfQ0xBU1Mob2MpOwogCi0gICAgLyoK
LSAgICAgKiBFbXVsYXRlIG9sZCBtYy0+aGFzX2R5bmFtaWNfc3lzYnVzPXRydWUgYXNzaWdubWVu
dAotICAgICAqCi0gICAgICpUT0RPOiBhZGQgb25seSBYZW4gZGV2aWNlcyB0byB0aGUgbGlzdAot
ICAgICAqLwotICAgIG1hY2hpbmVfY2xhc3NfYWxsb3dfZHluYW1pY19zeXNidXNfZGV2KG1jLCBU
WVBFX1NZU19CVVNfREVWSUNFKTsKKyAgICBtYWNoaW5lX2NsYXNzX2FsbG93X2R5bmFtaWNfc3lz
YnVzX2RldihtYywgVFlQRV9YRU5TWVNERVYpOwogfQogCiBpbnQgeGVuX2JlX3JlZ2lzdGVyKGNv
bnN0IGNoYXIgKnR5cGUsIHN0cnVjdCBYZW5EZXZPcHMgKm9wcykKLS0gCjIuMTQuMwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 5/5] docs/pvh: document initial MTRR state
Date: Thu, 10 May 2018 18:15:05 +0100
Message-ID: <20180510171505.37309-6-roger.pau@citrix.com>
References: <20180510171505.37309-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tie0=h5=citrix.com=prvs=66130e668=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fGpAP-0006qq-Dx
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 17:15:45 +0000
In-Reply-To: <20180510171505.37309-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UHJvdmlkZWQgdG8gYm90aCBEb20wIGFuZCBEb21Vcy4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFw
QGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Ci0tLQogZG9jcy9taXNjL3B2aC5tYXJrZG93biB8IDE1ICsrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kb2Nz
L21pc2MvcHZoLm1hcmtkb3duIGIvZG9jcy9taXNjL3B2aC5tYXJrZG93bgppbmRleCBlODVmYjE1
Mzc0Li42Mzk0MDFhODg3IDEwMDY0NAotLS0gYS9kb2NzL21pc2MvcHZoLm1hcmtkb3duCisrKyBi
L2RvY3MvbWlzYy9wdmgubWFya2Rvd24KQEAgLTkyLDMgKzkyLDE4IEBAIGV2ZW50IGNoYW5uZWxz
LiBEZWxpdmVyeSBvZiB0aG9zZSBpbnRlcnJ1cHRzIGNhbiBiZSBjb25maWd1cmVkIGluIHRoZSBz
YW1lIHdheQogYXMgSFZNIGd1ZXN0cywgY2hlY2sgeGVuL2luY2x1ZGUvcHVibGljL2h2bS9wYXJh
bXMuaCBhbmQKIHhlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtXF9vcC5oIGZvciBtb3JlIGluZm9y
bWF0aW9uIGFib3V0IGF2YWlsYWJsZSBkZWxpdmVyeQogbWV0aG9kcy4KKworIyMgTVRSUiAjIwor
CisjIyMgVW5wcml2aWxlZ2VkIGd1ZXN0cyAjIyMKKworUFZIIGd1ZXN0cyBhcmUgYm9vdGVkIHdp
dGggdGhlIGRlZmF1bHQgTVRSUiB0eXBlIHNldCB0byB3cml0ZS1iYWNrIGFuZCBNVFJSCitlbmFi
bGVkLiBUaGlzIGFsbG93cyBEb21VcyB0byBzdGFydCB3aXRoIGEgc2FuZSBNVFJSIHN0YXRlLiBO
b3RlIHRoYXQgdGhpcyB3aWxsCitoYXZlIHRvIGJlIHJldmlzaXRlZCB3aGVuIHBjaS1wYXNzdGhy
b3VnaCBpcyBhZGRlZCB0byBQVkggaW4gb3JkZXIgdG8gc2V0IE1NSU8KK3JlZ2lvbnMgYXMgVUMu
CisKKyMjIyBIYXJkd2FyZSBkb21haW4gIyMjCisKK0EgUFZIIGhhcmR3YXJlIGRvbWFpbiBpcyBi
b290ZWQgd2l0aCB0aGUgc2FtZSBNVFJSIHN0YXRlIGFzIHRoZSBvbmUgZm91bmQgb24KK3RoZSBo
b3N0LiBUaGlzIGlzIGRvbmUgYmVjYXVzZSB0aGUgaGFyZHdhcmUgZG9tYWluIG1lbW9yeSBtYXAg
aXMgYWxyZWFkeSBhCittb2RpZmllZCBjb3B5IG9mIHRoZSBob3N0IG1lbW9yeSBtYXAsIHNvIHRo
ZSBzYW1lIE1UUlIgc2V0dXAgc2hvdWxkIHdvcmsuCi0tIAoyLjE3LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

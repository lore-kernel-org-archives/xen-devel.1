From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] dmar: iommu mem leak fix
Date: Mon, 20 Aug 2018 05:45:36 -0600
Message-ID: <5B7AA9E002000078001DFFE3@prv1-mh.provo.novell.com>
References: <9b6a4488-c69a-48fa-88c1-131894b70b36@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9b6a4488-c69a-48fa-88c1-131894b70b36@default>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-Devel <xen-devel@lists.xen.org>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA4LjE4IGF0IDEyOjQyLCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3Jv
dGU6Cj4gUmVsZWFzZSBtZW1vcnkgYWxsb2NhdGVkIGZvciBkcmhkIGlvbW11IGluIGVycm9yIHBh
dGguCj4gCj4gLXYyOiBmaXh1cCB3cm9uZyBwYXJhbWV0ZXIgaGlkZW4gZHVlIHRvIG15IHJlbW92
aW5nIC1XZXJyb3IKClRoaXMgbGluZSBiZWxvbmdzIC4uLgoKPiBTaWduZWQtb2ZmLWJ5OiBaaGVu
emhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KPiAtLS0KCi4uLiBoZXJlLCBz
byBpdCB3b24ndCBlbmQgdXAgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBTdGlsbAoKUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFuZCBhcyBhbiBhZHZpY2UgLSBy
ZW1vdmluZyAtV2Vycm9yIGlzIHByZXR0eSBzdHJvbmdseSB0byBiZQphZHZpc2VkIGFnYWluc3Qu
CgpGaW5hbGx5LCB3aGlsZSBvbiB2MSB0aGUgQ2MgbGlzdCB3YXMgdG9vIHNob3J0LCBpdCBlbmRl
ZCB1cCB0b28KbG9uZyBub3c6IFRoZXJlJ3Mgbm8gcmVhc29uIGZvciB0aGUgVFhUIG1haW50YWlu
ZXJzIHRvIGJlIENjLWVkCm9uIHRoaXMgcGF0Y2gsIG9ubHkgcGF0Y2ggMiBpcyBpbiBuZWVkZWQg
b2YgdGhpcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

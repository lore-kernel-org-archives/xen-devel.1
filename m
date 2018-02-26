From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC Patch v4 8/8] x86/hvm: bump the maximum number
 of vcpus to 512
Date: Mon, 26 Feb 2018 01:26:42 -0700
Message-ID: <5A93D2D202000078001AB927@prv-mh.provo.novell.com>
References: <1512546614-9937-1-git-send-email-chao.gao@intel.com>
 <1512546614-9937-9-git-send-email-chao.gao@intel.com>
 <20180223181139.crabalgltt34ry7m@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180223181139.crabalgltt34ry7m@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Chao Gao <chao.gao@intel.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAyLjE4IGF0IDE5OjExLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRGVjIDA2LCAyMDE3IGF0IDAzOjUwOjE0UE0gKzA4MDAsIENoYW8gR2FvIHdyb3Rl
Ogo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgo+PiAtLS0K
Pj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX2luZm9fdGFibGUuaCB8IDIgKy0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX2luZm9fdGFibGUuaCAKPiBiL3hlbi9p
bmNsdWRlL3B1YmxpYy9odm0vaHZtX2luZm9fdGFibGUuaAo+PiBpbmRleCAwOGMyNTJlLi42ODMz
YTRjIDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9pbmZvX3RhYmxl
LmgKPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1faW5mb190YWJsZS5oCj4+IEBA
IC0zMiw3ICszMiw3IEBACj4+ICAjZGVmaW5lIEhWTV9JTkZPX1BBRERSICAgICAgICgoSFZNX0lO
Rk9fUEZOIDw8IDEyKSArIEhWTV9JTkZPX09GRlNFVCkKPj4gIAo+PiAgLyogTWF4aW11bSB3ZSBj
YW4gc3VwcG9ydCB3aXRoIGN1cnJlbnQgdkxBUElDIElEIG1hcHBpbmcuICovCj4+IC0jZGVmaW5l
IEhWTV9NQVhfVkNQVVMgICAgICAgIDEyOAo+PiArI2RlZmluZSBIVk1fTUFYX1ZDUFVTICAgICAg
ICA1MTIKPiAKPiBXb3csIHRoYXQgbG9va3MgbGlrZSBhIHByZXR0eSBiaWcganVtcC4gSSBjZXJ0
YWlubHkgZG9uJ3QgaGF2ZSBhY2Nlc3MKPiB0byBhbnkgYm94IHdpdGggdGhpcyBudW1iZXIgb2Yg
dkNQVXMsIHNvIHRoYXQncyBnb2luZyB0byBiZSBxdWl0ZSBoYXJkCj4gdG8gdGVzdC4gV2hhdCB0
aGUgcmVhc29uaW5nIGJlaGluZCB0aGlzIGJ1bXA/IElzIGhhcmR3YXJlIHdpdGggNTEyCj4gd2F5
cyBleHBlY3RlZCBzb29uLWlzaD8KPiAKPiBBbHNvIG9zc3Rlc3QgaXMgbm90IGV2ZW4gYWJsZSB0
byB0ZXN0IHRoZSBjdXJyZW50IGxpbWl0LCBzbyBJIHdvdWxkCj4gbWF5YmUgYnVtcCB0aGlzIHRv
IDI1NiwgYnV0IGFzIEkgZXhwcmVzc2VkIGluIG90aGVyIG9jY2FzaW9ucyBJIGRvbid0Cj4gZmVl
bCBjb21mb3J0YWJsZSB3aXRoIGhhdmUgYSBudW1iZXIgb2YgdkNQVXMgdGhhdCB0aGUgY3VycmVu
dCB0ZXN0Cj4gc3lzdGVtIGRvZXNuJ3QgaGF2ZSBoYXJkd2FyZSB0byB0ZXN0IHdpdGguCgpJIHRo
aW5rIGltcGxlbWVudGF0aW9uIGxpbWl0IGFuZCBzdXBwb3J0ZWQgbGltaXQgbmVlZCB0byBiZSBj
bGVhcmx5CmRpc3Rpbmd1aXNoZWQgaGVyZS4gVGhlcmVmb3JlIEknZCBwdXQgdGhlIHF1ZXN0aW9u
IHRoZSBvdGhlciB3YXkKYXJvdW5kOiBXaGF0J3MgY2F1c2luZyB0aGUgbGltaXQgdG8gYmUgNTEy
LCByYXRoZXIgdGhhbiAxMDI0LAo0MDk2LCBvciBldmVuIDRHLTEgKHgyQVBJQyBJRHMgYXJlIDMy
IGJpdHMgd2lkZSwgYWZ0ZXIgYWxsKT8KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

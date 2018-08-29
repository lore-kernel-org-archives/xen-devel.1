From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/build: Use new .nops directive when
 available
Date: Wed, 29 Aug 2018 00:31:55 -0600
Message-ID: <5B863DDB02000078001E2D48@prv1-mh.provo.novell.com>
References: <1534355858-17920-1-git-send-email-andrew.cooper3@citrix.com>
 <5B76C36C02000078001DF6B6@prv1-mh.provo.novell.com>
 <320f3c20-54c7-80d6-52f7-9ecb5a6d9e13@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <320f3c20-54c7-80d6-52f7-9ecb5a6d9e13@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDE5OjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTcvMDgvMTggMTM6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNS4w
OC4xOCBhdCAxOTo1NywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L2FsdGVybmF0aXZlLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hbHRl
cm5hdGl2ZS5jCj4+PiBAQCAtODQsNiArODQsMTkgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNo
YXIgKiBjb25zdCBwNl9ub3BzW0FTTV9OT1BfTUFYKzFdIAo+IAo+Pj4gaW5pdF9vcl9saXZlcGF0
Y2hfY29ucwo+Pj4gIAo+Pj4gIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyICogY29uc3QgKmlk
ZWFsX25vcHMgaW5pdF9vcl9saXZlcGF0Y2hfZGF0YSA9IHA2X25vcHM7Cj4+PiAgCj4+PiArI2lm
ZGVmIEhBVkVfQVNfTk9QX0RJUkVDVElWRQo+Pj4gKwo+Pj4gKy8qIE5vcHMgaW4gLmluaXQucm9k
YXRhIHRvIGNvbXBhcmUgYWdhaW5zdCB0aGUgcnVudGltZSBpZGVhbCBub3BzLiAqLwo+Pj4gK2Fz
bSAoICIucHVzaHNlY3Rpb24gLmluaXQucm9kYXRhLCBcImFcIiwgQHByb2diaXRzXG5cdCIKPj4+
ICsgICAgICAidG9vbGNoYWluX25vcHM6IC5ub3BzICIgX19zdHJpbmdpZnkoQVNNX05PUF9NQVgp
ICJcblx0Igo+Pj4gKyAgICAgICIucG9wc2VjdGlvblxuXHQiKTsKPj4gQW55IHBhcnRpY3VsYXIg
cmVhc29uIG5vdCB0byBwdXQgdGhlbSBpbiAuaW5pdC50ZXh0Pwo+IAo+IEJlY2F1c2UgaXRzIGRh
dGEsIG5vdCBleGVjdXRhYmxlIGNvZGUuCgpXZWxsLCBkZXBlbmRzLiBNeSB2aWV3IGlzIHRoYXQg
YW55IGluc24gaXMgKHBvdGVudGlhbGx5KSBleGVjdXRhYmxlCmNvZGUuIEluIGZhY3QgSSBsaWtl
IGdhcydlcyBiZWhhdmlvciBvbiBBUk0gd2hlcmUgaW5zbnMgYW5kIGRhdGEKZGlyZWN0aXZlcyBh
cmUgc2VwYXJhdGVkIGJ5IGVtaXR0aW5nICJhcnRpZmljaWFsIiBsYWJlbHMgYXMgbWFya2Vycy4K
QnV0IEknbSBmaW5lIGVpdGhlciB3YXkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

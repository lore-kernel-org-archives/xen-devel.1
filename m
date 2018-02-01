From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: 4.10.0-shim-comet backport request (was: [PATCH]
	xen/pvshim: ...)
Date: Thu, 1 Feb 2018 11:23:16 +0000
Message-ID: <20180201112234.rsx4i2p7efbfyz6f@MacBook-Pro-de-Roger.local>
References: <20180126152910.4320-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tmgq=e3=citrix.com=prvs=563c9b0be=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ehCxl-0006I0-J6
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 11:23:29 +0000
Content-Disposition: inline
In-Reply-To: <20180126152910.4320-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjYsIDIwMTggYXQgMDM6Mjk6MTBQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IERpc2FibGUgU01BUCBpbiB0aGUgc2hpbSBiZWZvcmUgYm91bmNpbmcgdGhlIGh5
cGVyY2FsbCwgb3IgZWxzZSBMMAo+IHdpbGwgZmFpbCB0byBnZXQgdGhlIGh5cGVyY2FsbCBidWZm
ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gUmVwb3J0ZWQtYnk6IEZhdGloIEFjYXIgPGZhdGloLmFjYXJAZ2FuZGkubmV0Pgo+
IC0tLQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxJYW4u
SmFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+IC0tLQo+IE5lZWRzIHRvIGJlIGJhY2twb3J0ZWQgdG8gdGhlIDQuMTAuMC1zaGltLWNvbWV0
IGJyYW5jaC4KCklhbiBjb3VsZCB5b3UgcGxlYXNlIGJhY2twb3J0IHRoaXMgdG8gdGhlIDQuMTAu
MC1zaGltLWNvbWV0IGJyYW5jaD8KClN0YWdpbmcgY29tbWl0IGlkIGlzIDExMjRhOWEyNmYwNTQz
OWEzYWEzMWVhZWEyMjcyODVlNTBkYzk0YzAuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

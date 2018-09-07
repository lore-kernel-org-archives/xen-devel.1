From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v18 13/13] x86/domctl: Don't pause the whole
 domain if only getting vcpu state
Date: Fri, 07 Sep 2018 03:47:29 -0600
Message-ID: <5B92493102000078001E6453@prv1-mh.provo.novell.com>
References: <1535980459-5457-1-git-send-email-aisaila@bitdefender.com>
 <1535980459-5457-14-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535980459-5457-14-git-send-email-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA5LjE4IGF0IDE1OjE0LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggaXMgZm9jdXNlZCBvbiBtb3ZpbmcgY2hhbmdpbmcgaHZtX3NhdmVfb25l
KCkgdG8gc2F2ZSBvbmUKPiB0eXBlY29kZSBmcm9tIG9uZSB2Y3B1IGFuZCBub3cgdGhhdCB0aGUg
c2F2ZSBmdW5jdGlvbnMgZ2V0IGRhdGEgZnJvbSBhCj4gc2luZ2xlIHZjcHUgd2UgY2FuIHBhdXNl
IHRoZSBzcGVjaWZpYyB2Y3B1IGluc3RlYWQgb2YgdGhlIGRvbWFpbi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KClJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

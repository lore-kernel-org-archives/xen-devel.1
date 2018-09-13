From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: fix GCC warning and remove duplicate
 EVTCHN_ROW/EVTCHN_COL usage
Date: Thu, 13 Sep 2018 18:59:53 -0400
Message-ID: <7e11300b-e590-4beb-28e7-bfc8bff73334__13057.9927623787$1536879445$gmane$org@oracle.com>
References: <20180913011354.GA19226@josh-ThinkPad-T460s>
 <37107f15-119b-118e-cbd3-1bb87356e442@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5dhn=l3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g0aZA-0004Oy-2W
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 22:58:28 +0000
In-Reply-To: <37107f15-119b-118e-cbd3-1bb87356e442@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Josh Abraham <j.abraham1776@gmail.com>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, aams@amazon.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8xMy8xOCAxOjEzIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDEzLzA5LzE4IDAz
OjEzLCBKb3NoIEFicmFoYW0gd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggcmVtb3ZlcyBkdXBsaWNhdGUg
bWFjcm8gdXNlYWdlIGluIGV2ZW50c19iYXNlLmMuCj4+Cj4+IEl0IGFsc28gZml4ZXMgZ2NjIHdh
cm5pbmc6Cj4+IHZhcmlhYmxlIOKAmGNvbOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgQWJyYWhhbSA8ai5h
YnJhaGFtMTc3NkBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KCkFwcGxpZWQgdG8gZm9yLWxpbnV4LTQuMTliLgoKLWJvcmlzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

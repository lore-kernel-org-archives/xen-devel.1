From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1.1 for-4.11 2/3] vpci/msix: fix incorrect
 usage of bitmask
Date: Mon, 26 Mar 2018 06:29:42 -0600
Message-ID: <5AB903D602000078001B614C@prv1-mh.provo.novell.com>
References: <20180326112826.80443-1-roger.pau@citrix.com>
 <20180326112826.80443-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zopv=gq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f0RFz-0003il-9Z
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 12:29:47 +0000
In-Reply-To: <20180326112826.80443-3-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, JulienGrall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAzLjE4IGF0IDEzOjI4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBiaXRtYXNrIHRvIGNsZWFyIHRoZSBsb3cgYml0cyBvZiB0aGUgYWRkcmVzcyBmaWVsZCBz
aG91bGQgYmUKPiB+MHhmZmZmZmZmZnVsbCwgdGhlIGN1cnJlbnQgbWFzayBjbGVhcnMgYm90aCB0
aGUgbG93IGFuZCB0aGUgaGlnaCBiaXRzCj4gb2YgdGhlIGFkZHJlc3MgZmllbGQsIHdoaWNoIGlz
IGEgYnVnLgo+IAo+IFJlcG9ydGVkLWJ5OiBDb3Zlcml0eQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

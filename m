From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] pvh/dom0: fix deadlock in GSI
 mapping
Date: Mon, 28 Jan 2019 08:30:02 -0700
Message-ID: <5C4F1FFA0200007800211CE9@prv1-mh.provo.novell.com>
References: <20190128142245.34923-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1go8rU-0000Ad-Eh
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 15:30:12 +0000
In-Reply-To: <20190128142245.34923-1-roger.pau@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAxLjE5IGF0IDE1OjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEluIG9yZGVyIHRvIHNvbHZlIGl0IG1vdmUgdGhlIHZpb2FwaWNfaHdkb21fbWFwX2dzaSBvdXRz
aWRlIG9mIHRoZQo+IGxvY2tlZCByZWdpb24gaW4gdmlvYXBpY193cml0ZV9yZWRpcmVudC4gdmlv
YXBpY19od2RvbV9tYXBfZ3NpIHdpbGwKPiBub3QgYWNjZXNzIGFueSBvZiB0aGUgdmlvYXBpYyBm
aWVsZHMsIHNvIHRoZXJlJ3Mgbm8gbmVlZCB0byBjYWxsIHRoZQo+IGZ1bmN0aW9uIGhvbGRpbmcg
dGhlIGh2bS5pcnFfbG9jay4KClRydWUsIGJ1dCB5b3UgYWxzbyBtb3ZlIHRoZSBjb2RlIGFjcm9z
cyBhIHZpb2FwaWNfZGVsaXZlcigpCmludm9jYXRpb24uIElzIHRoYXQgZGVsaXZlcnkgZ29pbmcg
dG8gd29yayB3aGVuCnZpb2FwaWNfaHdkb21fbWFwX2dzaSgpIGdldHMgaW52b2tlZCBvbmx5IGFm
dGVyd2FyZHM/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

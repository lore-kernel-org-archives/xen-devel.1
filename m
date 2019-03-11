From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/shadow: sh_{write,
 cmpxchg}_guest_entry() are PV-only
Date: Mon, 11 Mar 2019 17:24:01 +0000
Message-ID: <82282ab7-80ab-6220-d2d4-0c64551c6d2b@citrix.com>
References: <5C869339020000780021D664@prv1-mh.provo.novell.com>
 <5C8693C9020000780021D673@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qj7e=RO=citrix.com=prvs=9661cd40b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h3Oei-0005G0-Ir
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 17:24:04 +0000
In-Reply-To: <5C8693C9020000780021D673@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDMvMjAxOSAxNjo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTW92ZSB0aGVtIHRvIGEg
bmV3IHB2LmMuIE1ha2UgdGhlIHJlc3BlY3RpdmUgc3RydWN0IHNoYWRvd19wYWdpbmdfbW9kZQo+
IGZpZWxkcyBhcyB3ZWxsIGFzIHRoZSBwYWdpbmcuaCB3cmFwcGVycyBQVi1vbmx5IGFzIHdlbGwu
Cj4KPiBUYWtlIHRoZSBsaWJlcnR5IGFuZCBzd2l0Y2ggYm90aCBmdW5jdGlvbnMnICJmYWlsZWQi
IGxvY2FsIHZhcmlhYmxlcyB0bwo+IG1vcmUgYXBwcm9wcmlhdGUgdHlwZXMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

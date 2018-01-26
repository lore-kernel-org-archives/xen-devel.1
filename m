From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/pvshim: fix GNTTABOP_query_size
 hypercall forwarding with SMAP
Date: Fri, 26 Jan 2018 15:31:23 +0000
Message-ID: <5612b27a-cff7-93e5-2c84-546e740354a4@citrix.com>
References: <20180126152910.4320-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=iudn=ev=citrix.com=prvs=557142d6a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ef5z8-00018A-5E
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 15:32:10 +0000
In-Reply-To: <20180126152910.4320-1-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDEvMTggMTU6MjksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBEaXNhYmxlIFNNQVAg
aW4gdGhlIHNoaW0gYmVmb3JlIGJvdW5jaW5nIHRoZSBoeXBlcmNhbGwsIG9yIGVsc2UgTDAKPiB3
aWxsIGZhaWwgdG8gZ2V0IHRoZSBoeXBlcmNhbGwgYnVmZmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmVwb3J0ZWQtYnk6IEZh
dGloIEFjYXIgPGZhdGloLmFjYXJAZ2FuZGkubmV0PgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpEbyB3ZSBoYXZlIGFueSBvdGhlciBleGFt
cGxlcyBvZiB0aGlzP8KgIEkgZXhwZWN0IGl0IG1pZ2h0IGJlIGEgY29tbW9uCnNoaW0gcGF0dGVy
bi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

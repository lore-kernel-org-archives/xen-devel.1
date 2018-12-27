From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/5] x86/dom0: allow stealing RAM from a
 region that starts in the low 1MB
Date: Thu, 27 Dec 2018 19:34:47 +0000
Message-ID: <41ea7e2d-a568-6179-efa4-2782f0dedf9c@citrix.com>
References: <20181227152638.41648-1-roger.pau@citrix.com>
 <20181227152638.41648-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8dHC=PE=citrix.com=prvs=89228f4dd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gcbR1-0005up-UM
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 19:35:11 +0000
In-Reply-To: <20181227152638.41648-3-roger.pau@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTIvMjAxOCAxNToyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFzIGxvbmcgYXMg
dGhlIG1lbW9yeSBzdG9sZW4gaXMgYWx3YXlzIGFib3ZlIDFNQi4gVGhpcyBhbGxvd3MgdGhlIFBW
SAo+IERvbTAgYnVpbGRlciB0byBiZSB1c2VkIG9uIGEgbWVtb3J5IG1hcCB0aGF0IG9ubHkgaGFz
IGEgc2luZ2xlIFJBTQo+IHJlZ2lvbiBzdGFydGluZyBhdCAwLgo+Cj4gUmVwb3J0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KVGVzdGVkLWJ5OsKgIEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

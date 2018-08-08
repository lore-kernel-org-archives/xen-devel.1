From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/balloon: fix balloon initialization for
 PVH Dom0
Date: Wed, 8 Aug 2018 13:51:15 +0200
Message-ID: <44c992ed-f2bb-b4e9-d657-9f0b032ece5e__15324.3801011287$1533728998$gmane$org@suse.com>
References: <20180808114641.20854-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wssg=kx=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fnMzn-0003xu-4h
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 11:51:19 +0000
In-Reply-To: <20180808114641.20854-1-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gabriel Ercarug <bercarug@amazon.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDgvMTggMTM6NDYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBUaGUgY3VycmVudCBi
YWxsb29uIGNvZGUgdHJpZXMgdG8gY2FsY3VsYXRlIGEgZGVsdGEgZmFjdG9yIGZvciB0aGUKPiBi
YWxsb29uIHRhcmdldCB3aGVuIHJ1bm5pbmcgaW4gSFZNIG1vZGUgaW4gb3JkZXIgdG8gYWNjb3Vu
dCBmb3IgbWVtb3J5Cj4gdXNlZCBieSB0aGUgZmlybXdhcmUuCj4gCj4gVGhpcyB3b3JrYXJvdW5k
IGZvciBtZW1vcnkgYWNjb3VudGluZyBkb2Vzbid0IHdvcmsgcHJvcGVybHkgb24gYSBQVkgKPiBE
b20wLCB0aGF0IGhhcyBhIHN0YXRpYy1tYXggdmFsdWUgZGlmZmVyZW50IGZyb20gdGhlIHRhcmdl
dCB2YWx1ZSBldmVuCj4gYXQgc3RhcnR1cC4gTm90ZSB0aGF0IHRoaXMgaXMgbm90IGEgcHJvYmxl
bSBmb3IgRG9tVXMgYmVjYXVzZSBndWVzdHMgYXJlCj4gc3RhcnRlZCB3aXRoIGEgc3RhdGljLW1h
eCB2YWx1ZSB0aGF0IG1hdGNoZXMgdGhlIGFtb3VudCBvZiBSQU0gaW4gdGhlCj4gbWVtb3J5IG1h
cC4KPiAKPiBGaXggdGhpcyBieSBmb3JjZWZ1bGx5IHNldHRpbmcgdGFyZ2V0X2RpZmYgZm9yIERv
bTAsIHJlZ2FyZGxlc3Mgb2YKPiBpdCdzIG1vZGUuCj4gCj4gUmVwb3J0ZWQtYnk6IEdhYnJpZWwg
QmVyY2FydWcgPGJlcmNhcnVnQGFtYXpvbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

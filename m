From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 1/3] x86/mm: short-circuit HVM-only mode
 flags when !HVM
Date: Mon, 13 May 2019 17:18:00 +0100
Message-ID: <3b32ab18-cbca-330f-5ca5-aa0819e01786@citrix.com>
References: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
 <5CD42E37020000780022D32F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fllF=TN=citrix.com=prvs=029ba87d2=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hQDeW-0005Vz-DN
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 16:18:12 +0000
In-Reply-To: <5CD42E37020000780022D32F@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS85LzE5IDI6NDIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+ICNkZWZpbmUtaW5nIHRoZW0g
dG8gemVybyBhbGxvd3MgYmV0dGVyIGNvZGUgZ2VuZXJhdGlvbiBpbiB0aGlzIGNhc2UsCj4gYW5k
IHBhdmVzIHRoZSB3YXkgZm9yIG1vcmUgRENFLCBhbGxvd2luZyB0byBsZWF2ZSBjZXJ0YWluIGZ1
bmN0aW9ucyBqdXN0Cj4gZGVjbGFyZWQsIGJ1dCBub3QgZGVmaW5lZC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

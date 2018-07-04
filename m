From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Wed, 4 Jul 2018 16:47:27 +0100
Message-ID: <23356.60431.470201.125684@mariner.uk.xensource.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <20180703100733.mhfeia2vfywt6czx@mac.bytemobile.com>
 <FA03802B-3308-4BF8-B3D9-1E6DAB3DA64B@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8qzb=ju=citrix.com=prvs=716786cb2=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fak0C-0002Vt-9O
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 15:47:32 +0000
In-Reply-To: <FA03802B-3308-4BF8-B3D9-1E6DAB3DA64B@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW05vdGVzIGZvciB4ZW4gc3Vt
bWl0IDIwMTggZGVzaWduIHNlc3Npb25dIFByb2Nlc3MgY2hhbmdlczogaXMgdGhlIDYgbW9udGhs
eSByZWxlYXNlIENhZGVuY2UgdG9vIHNob3J0LCBTZWN1cml0eSBQcm9jZXNzLCAuLi4iKToKPiBJ
IHNlZW0gdG8gcmVjYWxsIHNheWluZyB0aGF0IGV2ZW4gaWYgd2UgYWdyZWVkIHRoYXQgbW92aW5n
IHRvIGNvbnRpbnVvdXMgZGVsaXZlcnkgd2FzIGEgZ29hbCB3ZSB3YW50ZWQgdG8gcHVyc3VlLCB3
ZSB3b3VsZCBzdGlsbCBiZSBzZXZlcmFsIHllYXJzIGF3YXkgZnJvbSBhY2hpZXZpbmcgYW55dGhp
bmcgbGlrZSBpdDsgYW5kIHNvIGluIHRoZSBtZWFuIHRpbWUsIGl0IHdvdWxkIHByb2JhYmx5IG1h
a2Ugc2Vuc2UgdG8gbW92ZSBiYWNrIHRvIGEgOS1tb250aCBjeWNsZSB3aGlsZSB3ZSBhdHRhY2sg
dGhlIHByb2JsZW0uCgpBbm90aGVyIHRoaW5nIHRoYXQgaXMgdGhhdCBhcyBvdXIgd2luZG93IG9m
IE4geWVhcnMnCnNlY3VyaXR5LXN1cHBvcnRlZCByZWxlYXNlcyBoYXMgZmlsbGVkIHVwIHdpdGgg
fjYtbW9udGggcmVsZWFzZXMsCnRoZXJlIGFyZSBtb3JlIG9mIHRoZW0uCgpJIGtub3cgd2UgaGFk
IGNvbmNlcm5zIHRoYXQgdGhpcyBtYWtlcyBiYWNrcG9ydGluZyBoYXJkZXIuICBJJ20gbm90CnJl
YWxseSBzdXJlIHRoYXQncyB0cnVlLiAgVGhlIHRvdGFsIGFtb3VudCBvZiBiYWNrcG9ydGluZyBs
b3NzYWdlCihtZXJnZSBjb25mbGljdHMgZXRjLikgaXMgdGhlIHNhbWUsIGFuZCB0cml2aWFsIGF1
dG9tYXRpYyBiYWNrcG9ydHMKYXJlIG5lYXJseSBubyB3b3JrLgoKQnV0IG9uZSB0aGluZyB0aGF0
IGlzIG5vdGljZWFibGUgaXMgdGhhdCB0aGlzIHNpZ25pZmljYW50bHkgaW5jcmVhc2VzCm91ciB0
ZXN0IGxvYWQgd2hlbiBhIHNlY3VyaXR5IHVwZGF0ZSBjb21lcyBvdXQuICBFYWNoCnNlY3VyaXR5
LXN1cHBvcnRlZCBicmFuY2ggZ2V0cyB1cGRhdGVzLCBhbmQgb3NzdGVzdCBzdWRkZW5seSBuZWVk
cyB0bwp0ZXN0IHRoZW0gYWxsLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

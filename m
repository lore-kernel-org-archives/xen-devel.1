From: =?UTF-8?Q?Juergen_Gro=c3=9f?= <jgross@suse.com>
Subject: Re: [PATCH 1/1] tools/ocaml: Dup2 /dev/null to stdin in
 daemonize()
Date: Wed, 27 Feb 2019 18:18:34 +0100
Message-ID: <cc743fe5-60e8-bce2-32d7-7b2e19fc8f1b@suse.com>
References: <20190227103342.26354-1-christian.lindig@citrix.com>
 <b057cd48-c6f1-2481-c427-3755d5de0cd1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NBDy=RC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gz2rH-0003sj-Gh
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 17:19:03 +0000
In-Reply-To: <b057cd48-c6f1-2481-c427-3755d5de0cd1@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, xen-devel@lists.xenproject.org
Cc: ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMi8yNy8xOSAxMTo0NiBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNy8wMi8yMDE5
IDEwOjMzLCBDaHJpc3RpYW4gTGluZGlnIHdyb3RlOgo+PiBEb24ndCBjbG9zZSBzdGRpbiBpbiBk
YWVtb25pemUoKSBidXQgZHVwMiAvZGV2L251bGwgaW5zdGVhZC4gVGhpcyBhdm9pZHMKPj4gZmQg
MCBiZWluZyByZXVzZWQgYW5kIHBvdGVudGlhbGx5IHdyaXR0ZW4gdG8uCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KPiAK
PiBQb3NzaWJseSB3b3J0aCBub3RpbmcgdGhhdCB0aGlzIGZpeGVzIGEgYnVnIHdoZXJlYnkgL2Rl
di94ZW4vZXZ0Y2huCj4gcmVsaWFibHkgZ2V0cyBvcGVuZWQgb24gZmQgMC4KPiAKPiBJIGNhbiBm
aXggdGhlIHdvcmRpbmcgdXAgb24gY29tbWl0IGlmIHRoZXJlIGFyZSBubyBvdGhlciBjb25jZXJu
cy4KPiAKPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4sIGFuZCBDQydpbmcKPiBKdWVyZ2VuIGZvciA0LjEyCgpSZWxlYXNlLWFja2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm: more sure APIC assist is aborted
 if guest EOIs APIC
Date: Thu, 18 Jan 2018 03:17:15 -0700
Message-ID: <5A60823B020000780019FCB3@prv-mh.provo.novell.com>
References: <20180117125353.3301-1-paul.durrant@citrix.com>
 <5A6069C9020000780019FB8D@prv-mh.provo.novell.com>
 <11888691a7414ff28915cec5ac8032a1@AMSPEX02CL03.citrite.net>
 <5A60793A020000780019FC41@prv-mh.provo.novell.com>
 <e6463fcadeff435eb0d885d9ce5c8a76@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udw+=en=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ec7G7-0000vy-HV
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 10:17:23 +0000
In-Reply-To: <e6463fcadeff435eb0d885d9ce5c8a76@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAxLjE4IGF0IDEwOjU1LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IE9rLiBJJ2xsIHJlLXdvcmsgaXQgc28gdGhhdCBhYm9ydCBpcyBwYXNzZWQgYSB2ZWN0b3Ig
YW5kIHdhcm5zIG9uIG1pc21hdGNoLgoKWW91IG1lYW4gb24gdGhlIG5ldyBwYXRoIG9ubHksIEkg
c3VwcG9zZT8gVGhlIG9sZCBwYXRoIHNob3VsZApub3QgdHJpZ2dlciB3YXJuaW5ncyAoYWl1aSBp
dCB3b3VsZCBhbHdheXMgZG8gc28pLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

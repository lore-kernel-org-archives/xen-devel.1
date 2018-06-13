From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [RFC PATCH 02/12] xen/manage: introduce helper
 function to know the on-going suspend mode
Date: Thu, 14 Jun 2018 03:41:55 +1000
Message-ID: <CAKTCnznqA=RcA1VWePn-Yt5AYn2-FKhXRJH8FgHjcG2Gjqc1Ow__39372.9561976672$1528914127$gmane$org@mail.gmail.com>
References: <20180612205619.28156-1-anchalag@amazon.com>
 <20180612205619.28156-3-anchalag@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mnd2=i7=gmail.com=bsingharora@srs-us1.protection.inumbo.net>)
 id 1fT9mQ-0001mK-A1
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 17:41:58 +0000
Received: by mail-vk0-x241.google.com with SMTP id b77-v6so2034475vkb.5
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jun 2018 10:41:56 -0700 (PDT)
In-Reply-To: <20180612205619.28156-3-anchalag@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anchal Agarwal <anchalag@amazon.com>
Cc: jgross@suse.com, Len Brown <len.brown@intel.com>, kamatam@amazon.com, eduval@amazon.com, vallish@amazon.com, netdev <netdev@vger.kernel.org>, Frank van der Linden <fllinden@amazon.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, guruanb@amazon.com, cyberax@amazon.com, Ingo Molnar <mingo@redhat.com>, Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>, linux-pm@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, boris.ostrovsky@oracle.com, Thomas Gleixner <tglx@linutronix.de>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMTMsIDIwMTggYXQgNjo1NiBBTSwgQW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFn
QGFtYXpvbi5jb20+IHdyb3RlOgo+IEZyb206IE11bmVoaXNhIEthbWF0YSA8a2FtYXRhbUBhbWF6
b24uY29tPgo+Cj4gSW50cm9kdWNlIHNpbXBsZSBmdW5jdGlvbnMgd2hpY2ggaGVscCB0byBrbm93
IHRoZSBvbi1nb2luZyBzdXNwZW5kIG1vZGUKPiBzbyB0aGF0IG90aGVyIFhlbi1yZWxhdGVkIGNv
ZGUgY2FuIGJlaGF2ZSBkaWZmZXJlbnRseSBhY2NvcmRpbmcgdG8gdGhlCj4gY3VycmVudCBzdXNw
ZW5kIG1vZGUuCgpJJ2Qgc3F1YXNoIHRoaXMgcGF0Y2ggd2l0aCB0aGUgcHJldmlvdXMsIHRoZSBw
cmV2aW91cyBvbmUganVzdCBsZWZ0CnRvbyBtYW55IG9wZW4gcXVlc3Rpb25zIGFib3V0IGhvdyBz
dXNwZW5kIG1vZGUgaXMgdXNlZC4gTG9va3MgbGlrZQpzdXNwZW5kIG1vZGUgaXMgYSBzdGF0ZSwg
YnV0IEkgYW0gbm90IHN1cmUgaWYgdmFsaWQgdHJhbnNpdGlvbnMgYXJlCmRlZmluZWQvY2hlY2tl
ZD8KCkJhbGJpciBTaW5naC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

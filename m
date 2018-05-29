From: George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH v2] x86/XPTI: fix S3 resume (and CPU
 offlining in general)
Date: Tue, 29 May 2018 12:29:12 +0100
Message-ID: <CAFLBxZY9ZAe2Pz8n95Zhc0SwD5+n_NrNbs4fjAS1BQa++Gnn-g@mail.gmail.com>
References: <5B07A70402000078001C5D20@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=44bc=iq=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1fNcoV-0001wq-NU
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 11:29:15 +0000
Received: by mail-qt0-x242.google.com with SMTP id d3-v6so18096607qtp.11
 for <xen-devel@lists.xenproject.org>; Tue, 29 May 2018 04:29:13 -0700 (PDT)
In-Reply-To: <5B07A70402000078001C5D20@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMjUsIDIwMTggYXQgNzowMiBBTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPiBXZSBzaG91bGQgaW5kZXggYW4gTDEgdGFibGUgd2l0aCBhbiBMMSBp
bmRleC4KPgo+IFJlcG9ydGVkLWJ5OiBTaW1vbiBHYWlzZXIgPHNpbW9uQGludmlzaWJsZXRoaW5n
c2xhYi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKRldJVyB0aGlzIGZpeGVzIHRoZSBpc3N1ZSBmb3IgbWUgYXMgd2VsbC4KCiAtR2VvcmdlCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

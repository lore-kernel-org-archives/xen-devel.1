From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 2/2] x86/emulate: Send vm_event from
 emulate
Date: Wed, 22 May 2019 07:57:33 -0600
Message-ID: <5CE5554D0200007800231628@prv1-mh.provo.novell.com>
References: <20190520125454.14805-1-aisaila@bitdefender.com>
 <20190520125454.14805-2-aisaila@bitdefender.com>
 <5CE51CBD0200007800231438@prv1-mh.provo.novell.com>
 <608cae57-7a7a-6502-9c9a-439aa0b88f25@bitdefender.com>
 <5CE54FD30200007800231603@prv1-mh.provo.novell.com>
 <b2619cfc-1ee1-c495-40e2-2652b24ad78c@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTRkP-0002Pu-RA
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 13:57:37 +0000
In-Reply-To: <b2619cfc-1ee1-c495-40e2-2652b24ad78c@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE5IGF0IDE1OjUwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IElzbid0IGl0IHNhZmVyIHRvIG1vdmUgdGhlIGh2bWVtdWxfc2VuZF92bV9ldmVudCgpIGZv
cm0gCj4gaHZtZW11bF9pbnNuX2ZldGNoKCkgdG8gX19odm1lbXVsX3JlYWQoKT8KClBvc3NpYmx5
IC0gSSBjYW4ndCB0ZWxsIHdoZXRoZXIgdGhhdCdsbCBmaXQgYWxsIHlvdXIgbmVlZHMuIEkgYWxz
bwpkb24ndCByZWNhbGwgd2hldGhlciB0aGlzIHdhcyBwcm9wb3NlZCBiZWZvcmUgYW5kIHRoZXJl
CndlcmUgcmVhc29ucyBzcGVha2luZyBhZ2FpbnN0IGRvaW5nIHNvLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

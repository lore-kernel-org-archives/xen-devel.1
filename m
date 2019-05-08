From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
Date: Wed, 8 May 2019 13:03:02 +0300
Message-ID: <964c1e29-2d83-3c7c-06eb-424c29ce6cfa@gmail.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
 <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+xT=TI=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hOJPo-0006Zf-HD
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 10:03:08 +0000
Received: by mail-lj1-x243.google.com with SMTP id n4so1021757ljg.4
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2019 03:03:07 -0700 (PDT)
In-Reply-To: <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gRGFyaW8sCgpTb3JyeSBmb3IgYSBkZWxheWVkIGFuc3dlciwKCk9uIDI2LjA0LjE5IDE4
OjEzLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiBZb3UncmUgc3VnZ2VzdGluZyB0aGF0J3MgcmVk
dW5kYW50IHRvbywgYXJlbid0IHlvdT8KClllcywgSSBkby4KQW5kIGhhdmUgcHVzaGVkIHRoZSBw
YXRjaCBbMV0uCgpbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE5LTA1L21zZzAwNTk3Lmh0bWwKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBB
bmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

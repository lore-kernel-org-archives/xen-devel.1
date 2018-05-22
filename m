From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Tue, 22 May 2018 07:57:57 -0600
Message-ID: <5B0421E502000078001C4B91__46138.1702138626$1526997416$gmane$org@prv1-mh.provo.novell.com>
References: <20180522035445.16911-1-boris.ostrovsky@oracle.com>
 <20180522035445.16911-2-boris.ostrovsky@oracle.com>
 <CAMzpN2iMrEqee+8yGP_qk-qAuXf+_o6vrOUSDTvX=8JAUDT5Fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fL7ne-0006nB-EP
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 13:58:02 +0000
In-Reply-To: <CAMzpN2iMrEqee+8yGP_qk-qAuXf+_o6vrOUSDTvX=8JAUDT5Fg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: brgerst@gmail.com
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDE1OjQ1LCA8YnJnZXJzdEBnbWFpbC5jb20+IHdyb3RlOgo+IE9u
IE1vbiwgTWF5IDIxLCAyMDE4IGF0IDExOjU0IFBNLCBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToKPj4gQEAgLTk4LDYgKzEwMSwxMiBAQCBFTlRSWShw
dmhfc3RhcnRfeGVuKQo+PiAgICAgICAgIC8qIDY0LWJpdCBlbnRyeSBwb2ludC4gKi8KPj4gICAg
ICAgICAuY29kZTY0Cj4+ICAxOgo+PiArICAgICAgIC8qIFNldCBiYXNlIGFkZHJlc3MgaW4gc3Rh
Y2sgY2FuYXJ5IGRlc2NyaXB0b3IuICovCj4+ICsgICAgICAgbW92ICRNU1JfR1NfQkFTRSwlZWN4
Cj4+ICsgICAgICAgbW92ICRjYW5hcnksICVyYXgKPj4gKyAgICAgICBjZHEKPj4gKyAgICAgICB3
cm1zcgo+IAo+IENEUSBvbmx5IHNpZ24tZXh0ZW5kcyBFQVggdG8gUkFYLiAgV2hhdCB5b3UgcmVh
bGx5IHdhbnQgaXMgdG8gbW92ZSB0aGUKPiBoaWdoIDMyLWJpdHMgdG8gRURYIChvciB6ZXJvIEVE
WCBpZiB3ZSBjYW4gZ3VhcmFudGVlIGl0IGlzIGxvYWRlZAo+IGJlbG93IDRHKS4KCldoYXQgeW91
IGRlc2NyaWJlIGlzIENEUUUgKEFUJlQgbmFtZTogQ0xURCk7IENEUSAoQVQmVDogQ0xUUSkKc2ln
bi1leHRlbmRzIEVBWCB0byBFRFg6RUFYLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

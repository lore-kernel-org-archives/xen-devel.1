From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Thu, 28 Feb 2019 03:30:39 -0700
Message-ID: <5C77B84F020000780021AFBF@prv1-mh.provo.novell.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <5C73D41B0200007800219C82@prv1-mh.provo.novell.com>
 <CAFLBxZYmBdR7Mte6i75Nn_a7rYx+0eh88mE3ukBb3tZNNVnZ7Q@mail.gmail.com>
 <alpine.DEB.2.10.1902250942570.4000@sstabellini-ThinkPad-X260>
 <eeec5cb2-5242-5331-21cb-e84317b85351@arm.com>
 <alpine.DEB.2.10.1902251311320.4000@sstabellini-ThinkPad-X260>
 <014390ec-6f3d-ce86-b760-c6b52362d22f@arm.com>
 <5C7520E6020000780021A46F@prv1-mh.provo.novell.com>
 <237094ca-6ec0-cb4d-9fab-c163909af0e2@gmail.com>
 <5C752758020000780021A4CB@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902261020580.20689@sstabellini-ThinkPad-X260>
 <85742448-F90D-4286-96BE-47E26F870E32@gmail.com>
 <5C76637C020000780021AA03@prv1-mh.provo.novell.com>
 <8ED7BDB6-C395-4B6A-B9CA-151B378CC49B@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gzIxf-0001l6-K8
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 10:30:43 +0000
In-Reply-To: <8ED7BDB6-C395-4B6A-B9CA-151B378CC49B@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, oleksandr_andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAyLjE5IGF0IDE4OjM0LCA8bGFycy5rdXJ0aC54ZW5AZ21haWwuY29tPiB3cm90
ZToKPiBXb3VsZCB5b3UgYmUgYWJsZSB0byBmb2xsb3cgbXkgc3VnZ2VzdGVkIGFwcHJvYWNoPwoK
SSBndWVzcyBzby4gU29tZSBvZiB0aGUgY29udGV4dCBzaG91bGQgcmVhbGx5IGhhdmUgYmVlbiBw
cm92aWRlZCBiZWZvcmUKdGhlIHBhdGNoZXMgd2VyZSBwb3N0ZWQsIHRob3VnaC4gQW5kIEkgc3Rp
bGwgdGhpbmsgd2Ugd2lsbCB3YW50IHRvIGhhdmUgYW4Kb3ZlcmFsbCBwaWN0dXJlIG9mIHRoZSBp
bXBhY3Qgb24gdGhlIGNvZGUgYmFzZSwgZXZlbiBpZiBpbml0aWFsbHkgdGhpcyBwaWN0dXJlCm1h
eSBub3QgYmUgZnVsbHkgYWNjdXJhdGUgaW5pdGlhbGx5LgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

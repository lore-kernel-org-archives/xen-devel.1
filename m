From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] xen: Change return type to vm_fault_t
Date: Thu, 10 May 2018 19:23:24 +0530
Message-ID: <CAFqt6zY0RJDHKqRD3vfnt1sUyObaKjqH7+XYiqSV3ey=d6OPEA@mail.gmail.com>
References: <20180414191542.GA19820@jordon-HP-15-Notebook-PC>
 <3b3aaa67-7166-34ba-39d8-5a1e1d138309@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=flvl=h5=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1fGm0e-000699-QY
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 13:53:28 +0000
Received: by mail-lf0-x243.google.com with SMTP id y72-v6so3104519lfd.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 May 2018 06:53:26 -0700 (PDT)
In-Reply-To: <3b3aaa67-7166-34ba-39d8-5a1e1d138309@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Matthew Wilcox <willy@infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMTYsIDIwMTggYXQgMTozMiBQTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPiBPbiAxNC8wNC8xOCAyMToxNSwgU291cHRpY2sgSm9hcmRlciB3cm90
ZToKPj4gVXNlIG5ldyByZXR1cm4gdHlwZSB2bV9mYXVsdF90IGZvciBmYXVsdCBoYW5kbGVyCj4+
IGluIHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU291
cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Cj4+IFJldmlld2VkLWJ5OiBNYXR0
aGV3IFdpbGNveCA8bWF3aWxjb3hAbWljcm9zb2Z0LmNvbT4KPgo+IFJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4KPgo+IEp1ZXJnZW4KPgoKQW55IGZ1cnRoZXIg
Y29tbWVudCBvbiB0aGlzIHBhdGNoID8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

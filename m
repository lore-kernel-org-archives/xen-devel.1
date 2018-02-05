From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] pvcalls-back: do not return error on
 inet_accept EAGAIN
Date: Mon, 5 Feb 2018 10:01:32 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802050953570.10160__47253.1923129738$1517853644$gmane$org@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1802021728420.10160@sstabellini-ThinkPad-X260>
 <936e4d18-3f0d-3fc5-2272-c1ad9a5c7022@oracle.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1047736138-1517853694=:10160"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gefk=e7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1eil5E-0000q1-2E
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 18:01:36 +0000
In-Reply-To: <936e4d18-3f0d-3fc5-2272-c1ad9a5c7022@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1047736138-1517853694=:10160
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 4 Feb 2018, Boris Ostrovsky wrote:
> On 02/02/2018 08:34 PM, Stefano Stabellini wrote:
> > When the client sends a regular blocking accept request, the backend is
> > expected to return only when the accept is completed, simulating a
> > blocking behavior, or return an error.
> > 
> > Specifically, on EAGAIN from inet_accept, the backend shouldn't return
> > "EAGAIN" to the client. Instead, it should simply continue the wait.
> > Otherwise, the client will send another accept request, which will cause
> > another EAGAIN to be sent back, which is a waste of resources and not
> > conforming to the expected behavior. Change the behavior by turning the
> > "goto error" into a return.
> > 
> > Signed-off-by: Stefano Stabellini <stefano@aporeto.com>
> 
> 
> I am looking at SYSCALL_DEFINE4(accept4) and sock->ops->accept (which *I
> think* is inet_accept, at least in some cases) passes all errors (including
> EAGAIN)  back to the caller. Is this a different case?

Hi Boris,

I didn't explain myself well. You are right that inet_accept passes all
errors back to the caller, but this is different: not only it would be a
waste of resources to do so, but the different behavior is specified in
the PVCalls spec:

"The backend will reply to the request only when a new connection is
successfully accepted, i.e. the backend does not return EAGAIN or
EWOULDBLOCK."

https://xenbits.xen.org/docs/unstable/misc/pvcalls.html

Look under the "Accept" sub-chapter.

Cheers,

Stefano
--8323329-1047736138-1517853694=:10160
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1047736138-1517853694=:10160--

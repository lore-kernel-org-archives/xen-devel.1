Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1737E606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 20:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lmBLWaKg
Received: from list by lists.xenproject.org with outflank-mailman.1461675.1672743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLRXy-0006Zb-Jn; Mon, 26 Oct 2026 20:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461675.1672743; Mon, 26 Oct 2026 20:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLRXy-0006ZJ-F9; Mon, 26 Oct 2026 20:43:58 +0000
Received: by outflank-mailman (input) for mailman id 1461675;
 Mon, 26 Oct 2026 20:43:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ludloff@gmail.com>) id 1xLRXx-0006ZD-2V
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 20:43:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLRXw-00F9aL-8a
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 21:43:56 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ludloff@gmail.com>)
 id 6adfbb6c-2eae-0a2a0a5409dd-0a2a450c96c8-34
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 21:43:56 +0100
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ludloff@gmail.com>)
 id 6adfbb8c-f479-0a2a450c0019-d155d02ce1fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 21:43:56 +0100
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6afbc363efeso5094016a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:43:56 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793047436; cv=none;
        d=google.com; s=arc-20260327;
        b=gtiZjH3lO4axl3rVLdo6Uuar9qjYl7iwjM++pJj1aXiLo6XjfU15C8mOX6YKHbpQMJ
         Jtrf8CxibAyX8UKXqW5hel9VAahp4127151zZy52q7AEgkbgI58mDK3qdcv6f5e4cwGw
         fhDpI4f9e4bEGXOV9u/ESkbIaIWoPD3jwhmHM9Prdv668y2akrZABRL8pTW4DICWZ5Z6
         ZX7Zs5f1owU6WmwJaFMFiuI+DvOjWkDVCsljbAz66iWuNd4kzZmOfXb5JJqY8PrYFDPy
         8gqQV3NJxTxnGKENyZ6u4OhluIehWCn16hXvxk3qdxniMXp4dY0ak9sRvdkcEwEnsIlR
         YtDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xTu6Sr8zNPkiNfTD8K1PlSAdCzZhpYHoWI/G69n+X68=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=K3eCEDCi1jjJo4Rwn4B/kTblVcBW0nHbX3UkWODfy9p/C/YttlJFhqQtZFJ9KUIkpX
         cHVlVnFGhad+SjuihclKHOoJh4B1bngksJkyeXHDhTOenNYuIZOwwSAuj0jvMlU56r2/
         NXcyUd6YH8UwCd7oozDT+bsUEnEIpKXF8FyUQWAeE4hJGF3fBaDWy4Unj3PvNL04o9n+
         BtWcZO4q3tyZLG7wuh9RoJW1wzcKlCI2J+ZyWmmp5R0uhKmxwWEoozavUPK4efukmacO
         Ok7Eh3EWKb5U74kG8GrTr6RK2Bjj4yrj0MpwhO9v3rlrtpukKagBedzvsaIYBc8j38hr
         F99g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047436; x=1793652236; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xTu6Sr8zNPkiNfTD8K1PlSAdCzZhpYHoWI/G69n+X68=;
        b=lmBLWaKgADlDGtBq+xz62ePvTuFT98jOwo/vh+vRxiVUS78+NmUb2Nnj7dvB2jGGm5
         3kjLWjpHU9ijOFISDa84g8aZNy/iyQeuiSgdz7rdU+OZ5vrDsPuVVISD2iXznHJh5yy8
         ELY7w55bp8wK/+993OTA+/JMjxSo7HAjh/svNWVMCAN0hh19ZWvID6Sg1Yl57TZu3CTi
         A3B4t/zGX8SHu3UhRWH1MrrYGwC7JPnp8RMsKImg2boP02BglNmcKON6Dc7pEPH/aeCW
         9xyc6RZ4gxsGaHD68gIQIIN5SPaOzPDm6/J+tUXqJsTn+46jHMQRB/oCUxUjjaS9Rmtw
         OnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047436; x=1793652236;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTu6Sr8zNPkiNfTD8K1PlSAdCzZhpYHoWI/G69n+X68=;
        b=ZOhm0wHv6iMlFVrBIXKh2NHQ9v7gKKko3aaq0EOQ7vYQ2eWdDgQ5RWAgpKdmUAgAMv
         YqDH4Ix/GChhOYk/Y8kZJFhMsACKbRNTF3O/uICWjLyoLUmwU9vcUKsJa5QIK+Es0uGF
         bAT5sqIZX+m7EqW7Q5JDa34a0FFTBt0/f0ks8cuFE3MLicVXIaZlEw+IpXl2z/QhmoI1
         6erUkF1OlutDaNy/50CKc4VC0XUimUuTQJ9/a5aZ6uRUbp543ipcsiJnGGU5M9zTusLr
         MMJAnOSzRhXGVHw0zR2bNbQFp03funyVAHJnQ4T2yL5Q0+K1kqpgfUgttZlXdC/tuRiP
         /Faw==
X-Gm-Message-State: AFq9FYIa8icayFfqCNhsl9oHAD8GX9nf9koaPAlkUtmhRyb61qpzzuI0
	4i52KIKzcnXgx8r1kXMSBBcJjZKe7312ni+y1i3xAo7sGJDilDNB3UFGmXdCnVouiFjUMr+DLA3
	59Avd81HQUMhYQdEEEOzVzjwsDXQdwz41uLzRRsY=
X-Gm-Gg: AYBFou1egOQgW5287fOPo61k2pp1qj+dbww/cxx8feQOdbvK+If1WCYBnKgM4pXTXcP
	8PpYU2aFdYZ9rWtdpo9DaQdCt35V1TDnp777CzW2pvEur/v9oT5lQ+dxPIaXTDqkB43L1DnuGHT
	LSurNi3qRHtH3PuDKGXz51mQREFxUqVc8kAsjKOzunG5usShRA4YYJXL1blYt/IJkISTHJoPmba
	hSAnoIr4S7dVF3tuXKcqY4nuOPWdLypYIDSzcmsYOnn0qbu3dNxmOHOQ2uhZIJTdX4DgQ4oMGnu
	tUK4Zbz/ONond8LAoHItz3MdbzW+vnWqkMXytLfyjABwmw93brmun1TYxsAkMXOcsmyc5bRAHbX
	6rXIjm12pq6KXMNpOJKPlUTD9yUExz3tIx4VMJ7jjYeMhsAkRsGSbqFHfKvfReJX2yRWXt4O1ci
	G/dt0yDlH538OMPhjxs4IwSAYHWxXBcMZvLlwFEicfOKSlNiUVkCSb8g==
X-Received: by 2002:a05:6402:c4de:20b0:6aa:f0e:a15f with SMTP id
 4fb4d7f45d1cf-6b442fff666mr6024755a12.38.1793047435692; Mon, 26 Oct 2026
 13:43:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAKSQd8UuWw+JQLr5=3erPj01RgSPq2szcWR7Piuu8CSRqR8jhA@mail.gmail.com>
In-Reply-To: <CAKSQd8UuWw+JQLr5=3erPj01RgSPq2szcWR7Piuu8CSRqR8jhA@mail.gmail.com>
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 26 Oct 2026 21:43:44 +0100
X-Gm-Features: AclHuK_j_9pfylA1mjSSzjo0x_fKp2ZJtJP4sHTIuJg5kkb2cpY2yEe0AgJN88I
Message-ID: <CAKSQd8WtFRX9JGkqnE1BivEezvk8Bws4+4Y-JDRVW2cNfh=Kdg@mail.gmail.com>
Subject: Re: [PATCH] x86/vlapic: Don't change ICR on x2APIC SELF_IPI write
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1793047436-00ECAA5B-25DC1A56/0/0
X-purgate-type: clean
X-purgate-size: 874
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 1:40=E2=80=AFAM Christian Ludloff <ludloff@gmail.co=
m> wrote:
>
> > It looks like it's a behavioural difference between Core and Atom.
> > Core modify ICR, while Atom do not.
>
> For Core there might be more nuance yet.
>
> I seem to have an ICL result for "does not".
>
> And I seem to have two SKL machs (same
> stepping, same ucode) that... disagree with
> each other. Some sort of config thing...?
>
> Maybe Intel can explain.
>
> I consider "does not" the cleaner behavior,
> unless a compelling explanation is offered.

Andy =E2=80=93 as discussed off list, both were cases
of a sneaky HV put in place by the mach FW.

So for the thread subject we got closure.

Sorry it took a little longer to track down =E2=80=93 in
the process the authors of the FW stack did
receive a belated dose of Spectre fallout.

--
C.

